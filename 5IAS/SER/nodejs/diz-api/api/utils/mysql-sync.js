const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DBNAME
});

mysqlConnection.connect();

exports.performQuerySync = (query) => {
    return new Promise((resolve, reject) => {
        mysqlConnection.query(query, (errors, results, fields) => {
            if (errors) reject(errors);
            resolve({ results: results, fields: fields });
        });
    });

}