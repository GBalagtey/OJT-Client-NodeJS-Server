var express = require('express');
var router = express.Router();
var connection = require('../database')
const bcrypt = require('bcrypt');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// GET help page
router.get('/getHelp', (req, res) => {
  res.render('getHelp'); // Render the 'getHelp.ejs' file
});

// GET dashboard page
router.get('/dashboard', (req, res) => {
  res.render('dashboard'); // Render the 'getHelp.ejs' file
});

// Function to compare a password with its hash
// async function comparePassword(password, hashedPassword) {
//   try {
//     console.log('Comparing passwords:', password, hashedPassword);
//     const match = await bcrypt.compare(password, hashedPassword);
//     console.log('Password comparison result:', match);
//     return match;
//   } catch (error) {
//     throw error;
//   }
// }

async function comparePassword(password, hashedPassword) {
  try {
    console.log('Comparing passwords:', password, hashedPassword);

    // Simple password comparison (without hashing)
    const match = password === hashedPassword;

    console.log('Password comparison result:', match);
    return match;
  } catch (error) {
    throw error;
  }
}



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

module.exports = router;
