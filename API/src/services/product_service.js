const Product = require('../models/product');
const User = require('../models/user');
const Category = require('../models/category');
const Sequelize = require('sequelize');

async function createProduct(product) {
    try {
        return await Product.create(product);
    } catch (error) {
        console.error('Error while creating category:', error);
        throw error;
    }
}


async function getProduct(){
    try{
        return await Product.findAll({
            include: [
                { model: User, as: 'User' },
                { model: Category, as: 'Category' }
            ]
        });
    } catch(error){
        console.error('Error while getting product:', error);
    }
}



module.exports = {
    createProduct,
    getProduct,
};
