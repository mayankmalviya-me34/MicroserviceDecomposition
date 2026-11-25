require('dotenv').config();
const express = require('express');
const app = express();

// Database connection
const databaseConnection = require('./database/connection');

// Import Product Repository
const ProductRepository = require('./database/repository/product-repository');
const productRepo = new ProductRepository();

const cors = require('cors');
app.use(cors());

app.use(express.json());

// --- Get All Products ---
app.get('/products', async (req, res) => {
    try {
        const products = await productRepo.Products();
        res.json(products);
    } catch (err) {
        console.error("Error fetching products:", err);
        res.status(500).json({ error: 'Failed to fetch products' });
    }
});

// --- Add New Product ---
app.post('/products', async (req, res) => {
    try {
        const { name, desc, type, unit, price, available, suplier, banner } = req.body;

        const newProduct = await productRepo.CreateProduct({
            name,
            desc,
            type,
            unit,
            price,
            available,
            suplier,
            banner
        });

        res.status(201).json(newProduct);
    } catch (err) {
        console.error("Error creating product:", err);
        res.status(500).json({ error: 'Failed to create product' });
    }
});

// --- Default Test Route ---
app.get('/', (req, res) => {
    res.send('Server is running!');
});

const startServer = async () => {
    try {
        // Connect to MongoDB
        await databaseConnection();

        // Get port from .env
        const PORT = process.env.PORT || 5000;

        app.listen(PORT, () => {
            console.log(`Server running on port ${PORT}`);
        });

    } catch (error) {
        console.error('Error starting server:', error);
        process.exit(1);
    }
};

startServer();
