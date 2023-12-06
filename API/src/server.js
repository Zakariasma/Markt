const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const db = require('./database/database');
const cors = require('cors');
const categoryController = require('./controllers/category_controller')

app.use(bodyParser.json());
const http = require('http');
const server = http.Server(app);

app.use(cors(
    {
        credentials: true,
        origin: '*'
    }
));

app.use('/api/category', categoryController);

server.listen(3000, () => {
    console.log('Server listening on port 3000');
});