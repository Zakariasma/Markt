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

async function getProductByCategoryID(categoryId){
    try{
        return await Product.findAll({
            where: { categoryId: categoryId },
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

async function getProductByUserID(userId){
    try{
        return await Product.findAll({
            where: { userId: userId },
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


async function getFourProductByCategoryNameExceptActualProduct(categoryName, actualID){
    try{
        const category = await Category.findOne({
            where: { name: categoryName }
        });
        return await Product.findAll({
            where: { categoryId: category.id, id: { [Sequelize.Op.not]: actualID } },
            order: [
                ['date', 'DESC']
            ],
            include: [
                { model: User, as: 'User' },
                { model: Category, as: 'Category' }
            ],
            limit: 4
        });
    } catch(error){
        console.error('Error while getting product:', error);
    }
}



module.exports = {
    createProduct,
    getProduct,
    getProductByCategoryID,
    getProductByUserID,
    getFourProductByCategoryNameExceptActualProduct,
};
