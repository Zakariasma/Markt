const User = require('../models/user');
const Sequelize = require('sequelize');

async function createUser(user) {
    try {
        const existingUser = await User.findOne({
            where: {
                username: user.username
            }
        });

        if (existingUser) {
            throw new Error('Le nom d\'utilisateur est déjà pris.');
        }
        let alphabet = 'abcdefghijk';
        let randomLetter = alphabet[Math.floor(Math.random() * alphabet.length)];
        user.picture = randomLetter + '.png';
        user.password = await User.hashPassword(user.password);
        return await User.create(user);
    } catch (error) {
        console.error('Error while creating user:', error);
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
async function loginUser(user) {
    try {
        const foundUser = await User.findOne({
            where: {
                [Sequelize.Op.and]: [
                    { username: user.username },
                ]
            }
        });
        if (foundUser && (await User.comparePassword(user.password, foundUser.password))) {
            const token = User.generateJWT(foundUser.toJSON());
            return { user: foundUser, token };
        } else {
            return null;
        }
    } catch (error) {
        console.error('Error while logging in user:', error);
        return null;
    }
}


module.exports = {
    createUser,
    getUser,
    loginUser,
};
