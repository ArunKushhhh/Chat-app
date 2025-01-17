import jwt from "jsonwebtoken";
import { Response } from "express";
import dotenv from "dotenv";

dotenv.config();

export const generateToken = (res: Response, userId: string) => {
  try {
    // Ensure JWT_SECRET is defined
    if (!process.env.JWT_SECRET) {
      throw new Error("JWT_SECRET is not defined in environment variables.");
    }

    // Create the token
    const token = jwt.sign({ userId }, process.env.JWT_SECRET, {
      expiresIn: "30d",
    });

    // Set JWT as HTTP-Only cookie
    res.cookie("jwt", token, {
      httpOnly: true,
      secure: process.env.NODE_ENV !== "development", // Use secure cookies in non-development environments
      sameSite: "strict",
      maxAge: 30 * 24 * 60 * 60 * 1000, // 30 days
    });
  } catch (error) {
    const err = error as Error; // Type assertion
    console.error("Error generating token:", err.message);
    throw new Error("Failed to generate authentication token.");
  }
};
