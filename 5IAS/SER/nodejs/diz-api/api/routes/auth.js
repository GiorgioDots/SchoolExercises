const express = require('express');
const { body } = require('express-validator');
const mysqlSync = require('../utils/mysql-sync');

const authController = require('../controllers/auth');

const router = express.Router();

router.put(
  '/signup',
  [
    body('nickname')
      .trim()
      .isLength({ min: 5 })
      .custom((value) => {
        return mysqlSync.performQuerySync(`SELECT id FROM users WHERE nickname = '${value}'`)
          .then(result => {
            if (result.results.length > 0) {
              console.log(result);
              return Promise.reject('Nickname already exists');
            }
          });
      }),
    body('password')
      .trim()
      .isLength({ min: 5 }),
    body('role')
  ],
  authController.signup
);

router.post('/login', authController.login);

module.exports = router;