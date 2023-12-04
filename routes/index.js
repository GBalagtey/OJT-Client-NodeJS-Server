var express = require('express');
const session = require('express-session');
var router = express.Router();
var connection = require('../database')
const bcrypt = require('bcrypt');

router.use(session({
  secret: 'ivar',
  resave: false,
  saveUninitialized: true
}));

// So you can't back if you logged out already
const noCacheMiddleware = (req, res, next) => {
  res.header('Cache-Control', 'private, no-cache, no-store, must-revalidate');
  res.header('Expires', '-1');
  res.header('Pragma', 'no-cache');
  next();
};

router.use(noCacheMiddleware);

const requireLogin = (req, res, next) => {
  if (!req.session.email) {
    // If there is no active session, redirect to the index (or login) page
    return res.redirect('/');
  }

  // If the user has an active session, continue to the next middleware or route handler
  next();
};

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// Add a new route for the "Get Started" button
router.get('/Login', (req, res) => {
  res.render('login'); // Render the 'login.ejs' file
});


// GET help page
router.get('/getHelp', requireLogin, (req, res) => {
  res.render('getHelp'); // Render the 'getHelp.ejs' file
});

// GET change password page
router.get('/getChangePassword', requireLogin, (req, res) => {
  res.render('changePassword'); // Render the 'changePassword.ejs' file
});

// GET history page
router.get('/getHistory', requireLogin, (req, res) => {
  res.render('history'); // Render the 'history.ejs' file
});

// GET dashboard page
router.get('/dashboard', requireLogin, (req, res) => {
  const email = req.session.email;

  if (!email) {
    res.redirect('/');
    return;
  }

  // Fetch all data from the student table based on the email
  const query = `
    SELECT student.*, course.*, program.programDescription, 
      ojt_requirements.requiredHours, 
      SEC_TO_TIME(SUM(TIME_TO_SEC(ojt_records.renderedHours))) AS total_time,
      SEC_TO_TIME(TIME_TO_SEC(student.demerit) + TIME_TO_SEC(ojt_requirements.requiredHours)) AS hours_required
    FROM student
    JOIN course ON student.courseID = course.courseCode
    JOIN program ON course.programID = program.programID
    JOIN ojt_requirements ON ojt_requirements.requirementID = student.requirementID
    JOIN ojt_records ON ojt_records.studID = student.studID
    WHERE student.studEmail = ?
  `;
  connection.query(query, [email], (error, results) => {
    if (error) {
      console.error('Error fetching user data:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    if (results.length > 0) {
      // If user is found, pass all data to the view
      const userData = results[0];
      userData.dob = userData.birthDate.toLocaleDateString();

      if(userData.photo != null){
      // Convert the Buffer data to a base64 string
      const base64Image = Buffer.from(userData.photo).toString('base64');
      userData.photo = `data:image/jpeg;base64,${base64Image}`;
      }
      const totalTime = userData.total_time;
      const requiredTotalTime = userData.hours_required;
      console.log(totalTime);
      console.log(requiredTotalTime)
      const partDuration = parseTime(totalTime);
      const totalDuration = parseTime(requiredTotalTime);
      const percentage = (partDuration / totalDuration) * 100;
      console.log(`Percentage: ${percentage}%`);
      userData.totalRenderedHours = percentage;
      res.render('dashboard', { userData });
    } else {
      console.log('User not found');
      res.send('User not found');
    }
  });
});


//function to convert time to seconds
function parseTime(timeString) {
  const [hours, minutes, seconds] = timeString.split(':').map(Number);
  return hours * 3600 + minutes * 60 + seconds;
}

// Function to compare a password with its hash
async function comparePassword(password, hashedPassword) {
  try {
    console.log('Comparing passwords:', password, hashedPassword);
    const match = await bcrypt.compare(password, hashedPassword);
    console.log('Password comparison result:', match);
    return match;
  } catch (error) {
    throw error;
  }
}

// logout
router.get('/logout', (req, res) => {
  // Destroy the session
  req.session.destroy((err) => {
    if (err) {
      console.error('Error destroying session:', err);
    } else {
      console.log('Session destroyed');
      res.redirect('/'); // Redirect to the home page or any desired page after logout
    }
  });
});


// Handle login POST request
router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;
    const values = [email];
    // Fetch user from the database based on the provided email
    const query = `
      SELECT users.*, student.studID, student.teacherID, student.companyID
      FROM users
      JOIN student ON users.email = student.studEmail
      WHERE users.email = ?;
    `;
    connection.query(query, values, async (error, results) => {
      if (error) {
        throw error;
      }

      if (results.length > 0) {
        const hashedPassword = results[0].hashedPassword;
        console.log('Query results:', results);

        const enteredPassword = password.trim();
        console.log('Entered Password:', enteredPassword);
        console.log('Hashed Password:', hashedPassword);

        // Assign values to variables
        const studID = results[0].studID;
        const teacherID = results[0].teacherID;
        const companyID = results[0].companyID;

        comparePassword(enteredPassword, hashedPassword)
          .then((match) => {
            if (match) {
              req.session.email = email;
              req.session.studID = studID;
              req.session.teacherID = teacherID;
              req.session.companyID = companyID;
              console.log('User credentials are valid');
              res.redirect('/dashboard');
            } else {
              console.log('Invalid password');
              res.send('Invalid Password');
            }
          })
          .catch((error) => {
            console.error('Error comparing passwords:', error);
          });
      } else {
        console.log('User not found');
        res.send('User not found');
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});


router.post('/changePassword', async (req, res) => {
  try {
    // Check if the session is still active
    if (!req.session.email) {
      // If there is no active session, redirect to the index (or login) page
      return res.redirect('/');
    }

    var email = req.session.email;
    const currentPassword = req.body.currentpass;
    const newPassword = req.body.newpass;
    console.log("PASSWORD", currentPassword);

    // Query to get the hashedPassword for the user with the specified email
    const query = 'SELECT hashedPassword FROM users WHERE email = ?';

    connection.query(query, [email], async (error, results) => {
      if (error) {
        console.error('Error fetching hashedPassword:', error);
        res.status(500).send('Internal Server Error');
        return;
      }

      if (results.length > 0) {
        const hashedPasswordFromDatabase = results[0].hashedPassword;

        // Compare the entered current password with the hashed password from the database
        const passwordMatch = await comparePassword(currentPassword, hashedPasswordFromDatabase);

        if (passwordMatch) {
          // If the passwords match, hash the new password
          const hashedNewPassword = await hashPassword(newPassword);

          // Update the user's hashed password in the database with the new hashed password
          const updateQuery = 'UPDATE users SET hashedPassword = ? WHERE email = ?';
          connection.query(updateQuery, [hashedNewPassword, email], (updateError, updateResults) => {
            if (updateError) {
              console.error('Error updating hashedPassword:', updateError);
              res.status(500).send('Internal Server Error');
            } else {
              console.log('Password updated successfully');
              res.redirect('/dashboard');
            }
          });
        } else {
          // Passwords do not match
          console.log('Current password does not match');
          res.send('Current password does not match');
        }
      } else {
        console.log('User not found');
        res.send('User not found');
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});


// Submit daily report
router.post('/submitDailyReport', async (req, res) => {
  try{
    const renderedHours = req.body.renderedHours;
    const description = req.body.description;
    const teacher = req.session.teacherID;
    const studId = req.session.studID;
    const date = getCurrentDate();
    const company = req.session.companyID;

    const query = `
    INSERT INTO ojt_records (studID, teacherID, companyID, renderedHours, date, workDescription)
    VALUES (?, ?, ?, ?, ?, ?);
    `;

    const values = [studId, teacher, company, renderedHours, date, description];
    console.log(values);

    connection.query(query, values, (error, results) => {
    if (error) {
      console.error('Error inserting daily report:', error);
      res.status(500).send('Internal Server Error');
    } else {
     console.log('Daily report inserted successfully');
      // Handle success, redirect, or send a response as needed
      res.redirect('/dashboard'); // Redirect to the dashboard or another page
    }
  });
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
})

router.get('/getLatestRecords', requireLogin, (req, res) => {
  const studId = req.session.studID;

  // Adjust the query to retrieve the relevant records for the specific student
  const query = `
    SELECT date, workDescription, renderedHours
    FROM ojt_records
    WHERE studID = ?
    ORDER BY date DESC
    LIMIT 3;
  `;

  connection.query(query, [studId], (error, results) => {
    if (error) {
      console.error('Error fetching latest records:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});

router.get('/getRecordHistory', requireLogin, (req, res) => {
  const studId = req.session.studID;

  // Adjust the query to retrieve the relevant records for the specific student
  const query = `
    SELECT *
    FROM ojt_records
    WHERE studID = ?
    ORDER BY date DESC;
  `;

  connection.query(query, [studId], (error, results) => {
    if (error) {
      console.error('Error fetching latest records:', error);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});

const saltRounds = 10;
async function hashPassword(password) {
  try {
    const salt = await bcrypt.genSalt(saltRounds);
    const hashedPassword = await bcrypt.hash(password, salt);
    return hashedPassword;
  } catch (error) {
    throw error;
  }
}

module.exports = router;

function getCurrentDate() {
  const currentDate = new Date();

  const year = currentDate.getFullYear();
  const month = (currentDate.getMonth() + 1).toString().padStart(2, '0'); // Zero-padding for months
  const day = currentDate.getDate().toString().padStart(2, '0'); // Zero-padding for days

  return `${year}-${month}-${day}`;
}