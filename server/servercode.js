require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const { MongoClient } = require('mongodb');
const bcrypt = require('bcryptjs');
const { check, validationResult } = require('express-validator');

const app = express();
const port = process.env.PORT || 3000;
const mongoUri = process.env.MONGODB_URI || 'mongodb://localhost:27017/Famie_PCS';

app.use(bodyParser.json());

MongoClient.connect(mongoUri, async (err, client) => {
  if (err) {
    console.error('Failed to connect to MongoDB', err);
    return;
  }

  console.log('Connected to MongoDB');
  const db = client.db();
  const usersCollection = db.collection('FAMIE_REG');

  app.post('/signup', [
    // Validate the input
    check('email').isEmail(),
    check('username').not().isEmpty(),
    check('password').isLength({ min: 6 })
  ], async (req, res) => {
    // Check the validation result
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    try {
      const { email, username, password } = req.body;
      const hashedPassword = await bcrypt.hash(password, 8);
      
      const userExists = await usersCollection.findOne({ email: email });
      if (userExists) {
        return res.status(400).json({ message: 'User already exists' });
      }
  
      await usersCollection.insertOne({
        email,
        username,
        password: hashedPassword,
      });
  
      res.status(201).json({ message: 'User created successfully' });
    } catch (error) {
      console.error('Signup error:', error);
      res.status(500).json({ message: 'Failed to sign up' });
    }
  });
  
  app.post('/login', [
    // Validate the input
    check('email').isEmail(),
    check('password').not().isEmpty()
  ], async (req, res) => {
    // Check the validation result
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    try {
      const { email, password } = req.body;
      const user = await usersCollection.findOne({ email: email });

      if (!user || !(await bcrypt.compare(password, user.password))) {
        return res.status(401).json({ message: 'Login failed. Check authentication credentials' });
      }

      res.status(200).json({ message: 'Login successful' });
    } catch (error) {
      res.status(500).json({ message: 'Failed to log in', error: error.toString() });
    }
  });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
