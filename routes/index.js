  var express = require('express');
  var router = express.Router();

  var database = require('../database');

  /* GET home page. */
  router.get('/', function(req, res, next) {
    res.render('index', { title: 'Express', session : req.session });
  });

  router.post('/', function(req, res, next){
    var userEmailAddress = request.body.user_email_address;
    var userPassword = request.body.user_password;

    if(userEmailAddress && userPassword)
    {
        query = `
        SELECT * FROM user
        WHERE email = "${userEmailAddress}"
        `;

        database.query(query, function(error, data){
            if(data.length > 0)
            {
                for(var count = 0; count < data.length; count++)
                {
                    if(data[count].user_password == userPassword)
                    {
                        request.session.userid = data[count].userid;

                        response.redirect("/views/test.html");
                    }
                    else
                    {
                        response.send('Incorrect Password');
                    }
                }
            }
            else
            {
                response.send('Incorrect Email Address');
            }
            response.end();
        });
    }
    else
    {
        
    }
  })

  router.get('/logout', function(request, response, next){
    request.session.destroy();
    response.redirect("/");
  })
  module.exports = router;
