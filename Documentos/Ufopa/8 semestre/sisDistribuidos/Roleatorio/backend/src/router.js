const express = require('express');

const router = express.Router();
const userController = require('./controllers/userController');
const eventController = require('./controllers/eventController');
const favoriteController = require('./controllers/favoriteController');
const tagController = require('./controllers/tagController');
// User
const { validateUserName, 
    vaidateUserEmail, 
    validateUserCpf, 
    validateUserCel, 
    validateUserPass } = require('./middlewares/userMiddleware');

// Evento
const {validateEventName,
    validateEventDescricao, 
    validateEventDia, 
    validateEventHora, 
    validateEventLocal, 
    validateEventStatus} = require('./middlewares/eventMiddleware');



// User
router.get('/user', userController.getAll);
router.post('/user', userController.registerUser);
router.put('/user/:id', 
    validateUserName, 
    validateUserCpf, 
    validateUserCel, 
    validateUserPass,
    userController.updateUser);

router.put('/user/:id/delete', userController.deleteUser);

// Eventos
router.get('/role', eventController.getAll);
router.post('/role', eventController.registerEvento);
router.put('/role/:id',
    validateEventName,
    validateEventDescricao,
    validateEventDia,
    validateEventHora,
    validateEventLocal,
    validateEventStatus,
    eventController.updateEvento);

router.put('/role/:id/finish', eventController.finishEvento);
router.put('/role/:id/cancel', eventController.cancelEvento);

// Favorito
router.get('/favorite', favoriteController.getAll);
router.post('/role/:id/favorite', favoriteController.registerFavorito);
router.delete('/role/unfavorite', favoriteController.cancelFavorito);

// tag
router.get('/tag', tagController.getAll);

module.exports = router;     