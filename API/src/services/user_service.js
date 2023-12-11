const User = require('../models/user');
const Sequelize = require('sequelize');

async function createUser(user) {
    try {
        return await User.create(user);
    } catch (error) {
        console.error('Error while creating category:', error);
        throw error;
    }
}


async function getUser(){
    try{
        return await User.findAll();
    } catch(error){
        console.error('Error while getting category:', error);
    }
}

async function loginUser(user){
    try{
        return await User.findOne({
            where: {
                [Sequelize.Op.and]: [
                    {email: user.email},
                    {password: user.password}
                ]
            }
        });
    } catch(error){
        console.error('Error while getting category:', error);
    }
}

module.exports = {
    createUser,
    getUser,
    loginUser,
};
