
// src/data/db.js
const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'fULLSTACK@@24',
  database: 'cine'
});

module.exports = pool.promise();
