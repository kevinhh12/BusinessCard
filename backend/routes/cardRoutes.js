const express = require('express');
const router = express.Router();
const cardController = require('../controllers/cardController');

router.post('/cards', cardController.createCard);
router.get('/cards/:userId', cardController.getCardsByUser);

module.exports = router;
