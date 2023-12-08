const express = require('express');
const ProductService = require('../services/product_service');
const router = express.Router();


router.post('/', async (req, res) => {
    try {
        const product = await ProductService.createProduct(req.body)
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
