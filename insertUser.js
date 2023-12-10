const bcrypt = require('bcrypt');
const mysqlConnection = require('./database'); // Update with the correct path
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

class User {
    static async insertUser(email, password, userType) {
      try {
        const hashedPassword = await hashPassword(password);
  
        // Log the generated hashed password
        console.log('Generated Hashed Password (insertUser):', hashedPassword);
  
        // SQL query to insert user into the users table
        const query = 'INSERT INTO users (email, hashedPassword, userType) VALUES (?, ?, ?)';
        const values = [email, hashedPassword, userType];
  
        // Execute the query
        mysqlConnection.query(query, values, (error, results) => {
          if (error) {
            throw error;
          }
  
          console.log('User inserted successfully:', results.insertId);
        });
      } catch (error) {
        console.error('Error inserting user:', error.message);
      }
    }
  }
  

// Example usage
const userEmail = 'mitski@slu.edu.ph';
const userPassword = 'samplepass2';
const userType = 'teacher';

// Call the insertUser method
User.insertUser(userEmail, userPassword, userType);
