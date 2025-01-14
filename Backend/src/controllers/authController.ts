import { Request, Response } from "express";
import bcrypt from "bcryptjs";
import User from "../models/User";
import createToken from "../utils/createToken";
import asyncHandler from "../middlewares/asyncHandler";

const saltRounds = 10;

export const register = asyncHandler(async (req: Request, res: Response) => {
  //get username, email, password
  const { username, email, password } = req.body;

  //before creating a user, check several validations
  //ensure that all the input fields are filled by the user
  if (!username || !email || !password) {
    throw new Error("Please fill all the input fields");
  }
  //check if the user already exists
  const userExists = await User.findOne({ email });
  if (userExists) res.status(400).send("User already exists");

  //hash the user password
  const hashedPassword = await bcrypt.hash(password, saltRounds);
  const newUser = new User({ username, email, password: hashedPassword });

  //insert data into db
  try {
    await newUser.save();
    createToken(res, newUser._id.toString());

    res.status(201).json({
      _id: newUser._id,
      username: newUser.username,
      email: newUser.email,
    });
  } catch (error) {
    console.error("Error saving user:", error);
    res.status(400);
    throw new Error("Invalid user data");
  }

  //return sucesss/error message to user
  res.status(201).json({ message: "User registered successfully" });
});

export const login = asyncHandler(async (req: Request, res: Response) => {
  //get email, password
  const { email, password } = req.body;

  //verify if the email already exists in our db
  const existingUser = await User.findOne({ email });

  //if the user exists, we need to check if he is prviding the right password
  if (existingUser) {
    //compare the password, if not, return an error 'invalid credentials'
    const isPasswordValid = await bcrypt.compare(
      password,
      existingUser.password
    );

    //if the password is valid, create a new token
    if (isPasswordValid) {
      createToken(res, existingUser._id.toString());

      res.status(201).json({
        _id: existingUser._id,
        username: existingUser.username,
        email: existingUser.email,
      });

      res.json({ message: "Login successfull" });
    } else {
      //if the password is not valid, send an error to the user
      res.status(401).json({ message: "Invalid Password" });
    }
  } else {
    //return sucesss/error message to user

    //if !existingUser (means user not present in the db), then show a message to the user
    res.status(401).json({ message: "User not found" });
  }
});
