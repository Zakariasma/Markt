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
    let productDTO = new ProductDTO();
    productDTO.id = product.id;
    productDTO.pictureList = product.pictureList;
    productDTO.title = product.title;
    productDTO.prix = product.prix;
    productDTO.category = product.category;
    productDTO.description = product.description;
    productDTO.date = product.date;
    productDTO.country = product.country;
    productDTO.postCode = product.postCode;
    productDTO.username = product.username;
    productDTO.profilPicture = product.profilPicture;
    return productDTO;
}

module.exports = {
    mappProducts,
    mappProduct,
};
