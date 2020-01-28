const { validationResult } = require('express-validator');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const mysqlSync = require('../utils/mysql-sync');

exports.login = (req, res, next) => {
  const nickname = req.body.nickname;
  const password = req.body.password;

  let userInfo;
  mysqlSync.performQuerySync(`SELECT * FROM users WHERE nickname = '${nickname}'`)
    .then(result => {
      if (result.results.length == 0) {
        const error = new Error('A user with this nickname could not be found.');
        error.statusCode = 401;
        throw error;
      }
      userInfo = result.results[0];
      return bcrypt.compare(password, userInfo.password);
    })
    .then(isEqual => {
      if (!isEqual) {
        const error = new Error('Wrong password.');
        error.statusCode = 401;
        throw error;
      }
      const token = jwt.sign({
        nickname: userInfo.nickname,
        id: userInfo.id
      },
        'supersecret'
      );
      res.status(200).json({ message: "Success", user: userInfo, token: token });
    })
    .catch(error => {
      if (!error.statusCode) {
        error.statusCode = 500;
      }
      next(error);
    })

}

exports.signup = (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    const error = new Error('Validation failed.');
    error.statusCode = 422;
    error.data = errors.array();
    throw error;
  }
  let nickname = req.body.nickname;
  let password = req.body.password;
  let role = req.body.role;
  mysqlSync.performQuerySync(`SELECT id FROM users WHERE nickname = '${nickname}'`)
    .then(result => {
      if (result.results.length > 0) {
        console.log(result);
        const error = new Error('Nickname already exists');
        error.statusCode = 402;
        throw error;
      }
      return Promise.resolve(result)
    })
    .then(result => {
      return bcrypt
        .hash(password, 12);
    })
    .then(hashedPw => {
      return mysqlSync.performQuerySync(`INSERT INTO users (nickname, password, role) VALUES ('${nickname}', '${hashedPw}', '${role}')`)
        .then(result => {
          return mysqlSync.performQuerySync(`SELECT * FROM users WHERE nickname = '${nickname}'`);
        });
    })
    .then(result => {
      const token = jwt.sign(
        {
          nickname: result.results[0].nickname,
          id: result.results[0].id
        },
        'supersecret'
      );
      res.status(201).json({ message: 'Success', user: result.results[0], token: token });
    })
    .catch(err => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    })
}