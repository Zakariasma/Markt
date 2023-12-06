const express = require('express');
const CategoryService = require('../services/category_service')
const router = express.Router();

const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, '../assets/static/category_img');
    },
    filename: function(req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage });

router.post('/', upload.single('image'), async (req, res) => {
    try {
        await CategoryService.createCategory(req.body, req.file);
        res.sendStatus(200);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


router.get('/', async (req, res) => {
    try {
        return res.json(await CategoryService.getCategoy());
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;
