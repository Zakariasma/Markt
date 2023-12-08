const db = require('../database/database');
const Product = require('./product');
const sequelize = db.sequelize;
const Sequelize = db.Sequelize;

const User = sequelize.define('user', {
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

User.sync()
    .then(() => console.log('Table "user" créée'))
    .catch(err => console.error('Erreur lors de la création de la table "category":', err));

module.exports = User;
