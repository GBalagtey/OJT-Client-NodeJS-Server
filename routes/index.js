var express = require('express');
var router = express.Router();
var connection = require('../database')

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

// Handle login POST request
router.post('/login', async (req, res) => {
  try {
      const { email, password } = req.body;
      // CURRENTLY GETTING UNDEFINED THATS WHY I CAN'T GET ANY RESULTS
      // Fetch user from the database based on the provided email
      const query = 'SELECT * FROM users WHERE BINARY email = ?';
      const results = await connection.query(query, [email]);
      console.log(email);
      console.log(password);
      console.log(results);
      console.log("length", results.length);
      if (results.length > 0) {
          // User found, compare plain text password
          const storedPassword = results[0].password;

          if (password === storedPassword) {
              // Passwords match, login successful
              res.redirect('/dashboard');
          } else {
              // Passwords do not match
              res.send('Invalid password');
          }
      } else {
          // User not found
          res.send('Invalid email or password');
      }
  } catch (error) {
      console.error(error);
      res.status(500).send('Internal Server Error');
  }
});

module.exports = router;
