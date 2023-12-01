var express = require('express');
var router = express.Router();
var database = require('../database');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express', session: req.session });
});

router.post('/', function(req, res, next) {
  var userEmailAddress = req.body.user_email_address;
  var userPassword = req.body.user_password;

res.redirect('/test');
  // if (userEmailAddress && userPassword) {
  //   // Assuming you want to retrieve user data based on the email address
  //   var query = `
  //     SELECT * FROM user
  //     WHERE email = "${userEmailAddress}"
  //   `;

  //   database.query(query, function(error, data) {
  //     if (error) {
  //       // Handle the database query error
  //       console.error(error);
  //       return res.status(500).send('Internal Server Error');
  //     }

  //     if (data.length > 0) {
  //       // Assuming only one user with the provided email address is found
  //       var user = data[0];

  //       if (user.user_password === userPassword) {
  //         req.session.userid = user.userid;
  //         return res.redirect('/test');
  //       } else {
  //         return res.send('Incorrect Password');
  //       }
  //     } else {
  //       return res.send('Incorrect Email Address');
  //     }
  //   });
  // } else {
  //   // Handle the case where either email or password is missing
  //   return res.send('Email and password are required');
  // }
});

router.get('/logout', function(request, response, next) {
  request.session.destroy();
  response.redirect("/");
});

module.exports = router;
