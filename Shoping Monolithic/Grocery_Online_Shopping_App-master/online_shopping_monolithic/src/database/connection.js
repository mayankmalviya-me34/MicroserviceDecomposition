const mongoose = require('mongoose');
require('dotenv').config(); // .env load kare

const DB_URL = process.env.MONGO_URI; // .env se MONGO_URI lo

module.exports = async () => {
    try {
        if (!DB_URL) {
            throw new Error('MongoDB URI is not defined in .env');
        }

        await mongoose.connect(DB_URL, {
            useNewUrlParser: true,
            useUnifiedTopology: true
            // useCreateIndex: true // Mongoose 6+ me ye option deprecated hai
        });

        console.log('Db Connected');
        
    } catch (error) {
        console.log('Error ============')
        console.log(error);
        process.exit(1);
    }
};
