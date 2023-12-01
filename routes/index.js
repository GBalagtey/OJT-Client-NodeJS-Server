var express = require('express');
var router = express.Router();
var database = require('./database')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// GET help page
router.get('/getHelp', (req, res) => {
  res.render('getHelp'); // Render the 'getHelp.ejs' file
});

module.exports = router;
