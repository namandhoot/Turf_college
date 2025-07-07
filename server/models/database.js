const { Sequelize } = require('sequelize');

// Get database URL from environment or use fallback for local development
const databaseUrl = process.env.DATABASE_URL || 'postgresql://postgres:password123@localhost:5432/turf_booking';

const sequelize = new Sequelize(databaseUrl, {
  dialect: 'postgres',
  logging: false, // Set to console.log to see SQL queries
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  },
  dialectOptions: {
    ssl: process.env.NODE_ENV === 'production' ? {
      require: true,
      rejectUnauthorized: false
    } : false
  }
});

// Test the connection
const testConnection = async () => {
  try {
    await sequelize.authenticate();
    console.log('Database connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
    console.log('Please ensure your database is running and DATABASE_URL is set correctly.');
  }
};

module.exports = { sequelize, testConnection }; 