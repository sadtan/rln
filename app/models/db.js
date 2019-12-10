"use strict"

var mysql = require("mysql");
console.log(process.env.SQL_PASS);
//
var con = mysql.createConnection(
    {
        host: "database-1.ccd10d51wnps.us-east-2.rds.amazonaws.com",
        user: process.env.SQL_USER,
        password: process.env.SQL_PASS,
        database: "undbtest"
    });
  
con.connect((err) => 
{
    if (err) throw err;
    console.log("DB Connected");
});

module.exports = con;