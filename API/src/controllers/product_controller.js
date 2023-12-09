const express = require('express');
const ProductService = require('../services/product_service');
const router = express.Router();

const multer = require('multer');
const path = require('path');
const CategoryService = require("../services/category_service");
const ProductMapper = require("../mapper/product_mapper");

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
        req.body.date = new Date();
        console.log(req.body);
        const product = await ProductService.createProduct(req.body);
        res.json(product);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/category/{categoryID}', async (req, res) => {
    try {
        let products = await ProductService.getProductByCategoryID(req.params.categoryID);
        let productsDTO = await ProductMapper.mappProducts(products);
        return res.json(productsDTO);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/userid/{userID}', async (req, res) => {
    try {
        let products = await ProductService.getProductByUserID(req.params.userID);
        let productsDTO = await ProductMapper.mappProducts(products);
        return res.json(productsDTO);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});




router.get('/', async (req, res) => {
    try {
        let products = await ProductService.getProduct();
        let productsDTO = await ProductMapper.mappProducts(products);
        return res.json(productsDTO);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;
