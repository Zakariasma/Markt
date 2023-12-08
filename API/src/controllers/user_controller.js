const express = require('express');
const UserService = require('../services/user_service')
const router = express.Router();


router.post('/', async (req, res) => {
    try {
        const user = await UserService.createUser(req.body)
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});



router.get('/', async (req, res) => {
    try {
        return res.json(await UserService.getUser());
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;
