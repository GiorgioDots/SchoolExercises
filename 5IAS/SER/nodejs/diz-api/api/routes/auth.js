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
      .isLength({ min: 5 }),
    body('password')
      .trim()
      .isLength({ min: 5 }),
    body('role')
  ],
  authController.signup
);

router.post('/login', authController.login);

module.exports = router;