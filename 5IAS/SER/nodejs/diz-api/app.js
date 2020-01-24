
require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
var mysql = require('mysql');
const authRoutes = require('./api/routes/auth');
const dicRoutes = require('./api/routes/dictionary');

const app = express();
app.use(bodyParser.json());
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader(
    'Access-Control-Allow-Methods',
    'OPTIONS, GET, POST, PUT, PATCH, DELETE'
  );
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

app.use('/auth', authRoutes);
app.use('/dictionary', dicRoutes);
app.use((error, req, res, next) => {
  console.log(error);
  const status = error.statusCode || 500;
  const message = error.message;
  const data = error.data;
  res.status(status).json({ message: message, data: data });
});

app.get('/healthcheck', (req, res, next) => { res.status(200).json({ status: "ok" }); next() })

app.listen(process.env.PORT || 8080);