const db = require('../database/database');
const sequelize = db.sequelize;
const Sequelize = db.Sequelize;

const Category = sequelize.define('category', {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            allowNull: false,
            primaryKey: true
        },
        category_name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        image: {
            type: Sequelize.STRING,
            allowNull: false
        },

    }, {
        tableName: 'category',
        timestamps: false
    }
);

Category.sync()
    .then(() => console.log('Table "category" créée'))
    .catch(err => console.error('Erreur lors de la création de la table "category":', err));

module.exports = Category;
