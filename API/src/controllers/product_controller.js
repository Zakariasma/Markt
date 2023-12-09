const express = require('express');
const ProductService = require('../services/product_service');
const router = express.Router();

const multer = require('multer');
const path = require('path');
const CategoryService = require("../services/category_service");
const ProductMapper = require("../mapper/product_mapper");
const Product = require("../models/product");

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

router.get('/category/:categoryId', async (req, res) => {
    try {
        console.log(req.params.categoryId);
        const products = await ProductService.getProductByCategoryID(req.params.categoryId);
        const productsDTO = await ProductMapper.mappProducts(products);
        return res.json(productsDTO);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.get('/user/:userId', async (req, res) => {
    try {
        console.log(req.params.userId);
        const products = await ProductService.getProductByUserID(req.params.userId);
        const productsDTO = await ProductMapper.mappProducts(products);
        return res.json(productsDTO);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});




router.get('/', async (req, res) => {
    try {
        const products = await ProductService.getProduct();
        const productsDTO = await ProductMapper.mappProducts(products);
        return res.json(productsDTO);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});



module.exports = router;
