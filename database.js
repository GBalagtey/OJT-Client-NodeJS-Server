// to connect to the database
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    database: 'ojt_portaldb',
    user: 'root',
    password: ''
});

connection.connect(function(error){
    if(error)
    {
        throw error;
    }
    else{
        console.log('MYSQL Database connected successfully')
    }
});

module.exports = connection;