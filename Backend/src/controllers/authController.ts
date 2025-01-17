import { Request, Response } from "express";
import bcrypt from "bcryptjs";
import User from "../models/User";
import { generateToken } from "../utils/createToken";
import asyncHandler from "../middlewares/asyncHandler";
import dotenv from "dotenv";
dotenv.config();

const saltRounds = 10;

export const register = asyncHandler(async (req: Request, res: Response) => {
  // get username, email, password
  const { username, email, password } = req.body;

  // ensure that all the input fields are filled by the user
  if (!username || !email || !password) {
    res.status(400);
    throw new Error("Please fill all the input fields");
  }

  // check if the user already exists
  const userExists = await User.findOne({ email });
  if (userExists) {
    res.status(400);
    throw new Error("User already exists");
  }

  // hash the user password
  const hashedPassword = await bcrypt.hash(password, saltRounds);
  const newUser = new User({ username, email, password: hashedPassword });

  // insert data into db
  const savedUser = await newUser.save();
  
  if (savedUser) {
    generateToken(res, savedUser._id.toString());
    
    res.status(201).json({
      _id: savedUser._id,
      username: savedUser.username,
      email: savedUser.email,
      message: "User registered successfully"
    });
  } else {
    res.status(400);
    throw new Error("Invalid user data");
  }
});

export const login = asyncHandler(async (req: Request, res: Response) => {
  const { email, password } = req.body;

  // Validate input
  if (!email || !password) {
    res.status(400);
    throw new Error("Please provide email and password");
  }

  const existingUser = await User.findOne({ email });

  if (!existingUser) {
    res.status(401);
    throw new Error("User not found");
  }

  const isPasswordValid = await bcrypt.compare(password, existingUser.password);

  if (!isPasswordValid) {
    res.status(401);
    throw new Error("Invalid password");
  }

  // Create token and send response
  generateToken(res, existingUser._id.toString());

  res.status(200).json({
    _id: existingUser._id,
    username: existingUser.username,
    email: existingUser.email,
    message: "Login successful",
  });
});
