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
            order: [
                ['date', 'DESC']
            ],
            include: [
                { model: User, as: 'User' },
                { model: Category, as: 'Category' }
            ]
        });
    } catch(error){
        console.error('Error while getting product:', error);
    }
}

async function getProductByCategoryID(categoryID){
    try{
        return await Product.findAll({
            where: { categoryID: categoryID },
            order: [
                ['date', 'DESC']
            ],
            include: [
                { model: User, as: 'User' },
                { model: Category, as: 'Category' }
            ]
        });
    } catch(error){
        console.error('Error while getting product:', error);
    }
}

async function getProductByUserID(userID){
    try{
        return await Product.findAll({
            where: { userID: userID },
            order: [
                ['date', 'DESC']
            ],
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
    getProductByCategoryID,
    getProductByUserID
};
