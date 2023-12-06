const Sequelize = require('sequelize');

const sequelize = new Sequelize('squaredb', 'squarehelha', 'squarepass', {
  host: 'localhost',
  dialect: 'postgres',
  port: 5440,
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  },
});

module.exports = {
  sequelize,
  Sequelize,
};
