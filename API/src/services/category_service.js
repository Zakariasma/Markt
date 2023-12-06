const Category = require("../models/category")
const Sequelize = require('sequelize');

async function createCategory(categoryData, file) {
    try {
        categoryData.image = file.filename;
        return await Category.create(categoryData);
    } catch (error) {
        console.error('Error while creating category:', error);
        throw error;
    }
}


async function getCategoy(){
    try{
        return await Category.findAll();
    } catch(error){
        console.error('Error while getting category:', error);
    }
}

module.exports = {
    createCategory,
    getCategoy,
};
