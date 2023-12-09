const mysql = require('mysql2');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.listen(3000, () => console.log('Listening... (Use localhost:3000)'));

const dbconn = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'password',
    database:'chatify'
});


// connect to the mysql database
dbconn.connect((error) => {
    if (error) {
        console.log("Can't connect to database!", error);
    } else {
        console.log("Connection successful!");
    }
});

app.get('/api/getalbums', (req, res) => {
    dbconn.promise().query("SELECT * from albums;")
    .then( ([rows]) => {
        res.json({ rows })
    })
    .catch((err) => console.log(err))
});