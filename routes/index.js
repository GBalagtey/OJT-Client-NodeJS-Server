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
    SELECT student.*, program.programDescription
    FROM student
    JOIN program ON student.programID = program.programID
    WHERE student.studEmail = ?;
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
      userData.dob = userData.dob.toLocaleDateString();
      res.render('dashboard', { userData });
    } else {
      console.log('User not found');
      res.send('User not found');
    }
  });
});


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
      const query = 'SELECT * FROM users WHERE email = ?';
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
        
        comparePassword(enteredPassword, hashedPassword)
            .then((match) => {
              if (match) {
                req.session.email = email;
                console.log('User credentials are valid');
                res.redirect('/dashboard');
              } else {
                console.log('Invalid password');
                res.send("Invalid Password")
              }
            })
            .catch((error) => {
              console.error('Error comparing passwords:', error);
            });
      } else {
        console.log('User not found');
        res.send("User not found")
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
