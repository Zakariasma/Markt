const db = require('../database/database');
const User = require('./user');
const Category = require('./category');
const sequelize = db.sequelize;
const Sequelize = db.Sequelize;

const Product = sequelize.define('product', {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            allowNull: false,
            primaryKey: true
        },
        pictureList: {
            type: Sequelize.ARRAY(Sequelize.STRING),
            allowNull: false
        },
        title: {
            type: Sequelize.STRING,
            allowNull: false
        },
        prix: {
            type: Sequelize.STRING,
            allowNull: false
        },
        categoryId: {
            type: Sequelize.INTEGER,
            references: {
                model: Category,
                key: 'id',
            }
        },
        description: {
            type: Sequelize.STRING,
            allowNull: false
        },
        country: {
            type: Sequelize.STRING,
            allowNull: false
        },
        postCode: {
            type: Sequelize.STRING,
            allowNull: false
        },
        userId: {
            type: Sequelize.INTEGER,
            references: {
                model: User,
                key: 'id',
            }
        }

    }, {
        tableName: 'product',
        timestamps: false
    }
);

Product.belongsTo(User);
Product.belongsTo(Category);
Product.sync()
    .then(() => console.log('Table "product" créée'))
    .catch(err => console.error('Erreur lors de la création de la table "product":', err));

module.exports = Product;
