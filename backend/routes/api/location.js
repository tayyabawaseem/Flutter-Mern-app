const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");

const LocationSchema = new mongoose.Schema({
  userId: String,
  latitude: Number,
  longitude: Number,
  createdAt: { type: Date, default: Date.now }
});

const Location = mongoose.model("Location", LocationSchema);

router.post("/api/location", async (req, res) => {
  const { userId, latitude, longitude } = req.body;

  try {
    const newLocation = new Location({ userId, latitude, longitude });
    await newLocation.save();
    res.status(200).json({ message: "Location saved" });
  } catch (error) {
    res.status(500).json({ error: "Failed to save location" });
  }
});

module.exports = router;
