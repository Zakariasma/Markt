const express = require('express');
const ProductService = require('../services/product_service');
const router = express.Router();

const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, '../assets/static/product_img');
    },
    filename: function(req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage });

router.post('/', upload.array('pictureList', 3), async (req, res) => {
    try {

        let pictureList = req.files.map(file => file.filename);
        req.body.pictureList = pictureList;
        console.log(req.body);
        const product = await ProductService.createProduct(req.body);
        res.json(product);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});





router.get('/', async (req, res) => {
    try {
        return res.json(await ProductService.getProduct());
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;
