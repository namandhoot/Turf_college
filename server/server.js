require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { sequelize, testConnection } = require('./models/database');
const authRoutes = require('./routes/auth');
const bookingRoutes = require('./routes/bookings');
const healthRoutes = require('./routes/health');
const { metricsMiddleware, metricsEndpoint } = require('./middleware/metrics');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(metricsMiddleware);

// Test database connection
testConnection();

// Sync database (create tables if they don't exist)
sequelize.sync({ alter: true })
  .then(() => console.log('Database synced'))
  .catch(err => console.log('Database sync error:', err));

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/bookings', bookingRoutes);
app.use('/api', healthRoutes);
app.get('/metrics', metricsEndpoint);

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!' });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
