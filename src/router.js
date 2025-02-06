const express = require('express');

const router = express.Router();
const userController = require('./controllers/userController');
const { validateUserName, vaidateUserEmail, validateUserCpf, validateUserCel, validateUserPass } = require('./middlewares/userMiddleware');

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


module.exports = router;