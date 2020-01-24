const express = require('express');
const isAuth = require('../middleware/is-auth');
const dicController = require('../controllers/dictionary');

const router = express.Router();

router.get('/', dicController.getWords);

router.get('/word', dicController.getWord);

router.put('/word', isAuth, dicController.newWord);

router.post('/word', isAuth, dicController.updateWord);

router.delete('/word', isAuth, dicController.deleteWord);

module.exports = router;