// to connect to the database
const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'db',
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