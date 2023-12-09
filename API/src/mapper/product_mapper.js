const Product = require('../models/product');
const Category = require('../models/category');
const User = require('../models/user');
const ProductDTO = require('../dto/product_dto');
const ProductService = require('../services/product_service');


async function mappProducts(products) {
    let productsDTO = [];
    for (let product of products) {
        let productDTO = await mappProduct(product);
        productsDTO.push(productDTO);
    }
    return productsDTO;
}

async function mappProduct(product) {
    return new ProductDTO(product.dataValues);
}



module.exports = {
    mappProducts,
    mappProduct,
};
