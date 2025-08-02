require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;

// ✅ Middleware
app.use(cors());
app.use(express.json());

// ✅ Test Route
app.get('/', (req, res) => {
  res.send('✅ API is running...');
});

// ✅ Routes
const registerRoute = require('./routes/api/register');
app.use('/api/register', registerRoute);

const loginRoute = require('./routes/api/login');
app.use('/api/login', loginRoute);

const locationRoute = require('./routes/api/location');
app.use('/api/location', locationRoute);

// ✅ MongoDB Connection
mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true
})
.then(() => console.log("✅ MongoDB connected"))
.catch(err => console.error("❌ DB connection error:", err));

// ✅ Start server
app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
