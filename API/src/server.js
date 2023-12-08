const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const db = require('./database/database');
const cors = require('cors');
const categoryController = require('./controllers/category_controller');
const userController = require('./controllers/user_controller');
const path = require('path');

const User = require('./models/user');
const Category = require('./models/category');
const Product = require('./models/product');


app.use(bodyParser.json());
const http = require('http');
const server = http.Server(app);

app.use(cors(
    {
        credentials: true,
        origin: '*'
    }
));

app.use('/assets', express.static(path.join(__dirname, '../assets')));
app.use('/api/category', categoryController);
app.use('/api/user', userController);


server.listen(3000, () => {
    console.log('Server listening on port 3000');
});