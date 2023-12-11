const db = require('../database/database');
const sequelize = db.sequelize;
const Sequelize = db.Sequelize;
const bcrypt = require('bcrypt');

require('dotenv').config();

const jwt = require('jsonwebtoken');

const config = {
    jwtSecret: process.env.JWT_SECRET
};

const User = sequelize.define('User', {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            allowNull: false,
            primaryKey: true
        },
        username: {
            type: Sequelize.STRING,
            allowNull: false
        },
        password: {
            type: Sequelize.STRING,
            allowNull: false
        },
        picture: {
            type: Sequelize.STRING,
            allowNull: false
        },

    }, {
        tableName: 'user',
        timestamps: false
    }
);

User.hashPassword = async function (password) {
    return await bcrypt.hash(password, 10);
};

User.comparePassword = async function (password, hash) {
    return await bcrypt.compare(password, hash);
}

User.generateJWT = function (user) {
    const payload = {
        id: user.id,
        username: user.username,
        picture: user.picture
    };

    const expiresIn = 3 * 30 * 24 * 60 * 60;
    const token = jwt.sign(payload, config.jwtSecret, { expiresIn });

    return token;
}

User.checkToken = function (token) {
    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        return decoded;
    } catch (error) {
        // La vérification du token a échoué
        console.error('Erreur de vérification du token:', error.message);
        return null;
    }
}

User.sync()
    .then(() => console.log('Table "user" créée'))
    .catch(err => console.error('Erreur lors de la création de la table "category":', err));

module.exports = User;
