import mongoose, { Schema, Document, Model } from "mongoose";

// Define the User interface
interface IUser extends Document {
  _id: mongoose.Types.ObjectId;
  username: string;
  email: string;
  password: string;
}

// Define the User schema
const userSchema: Schema<IUser> = new mongoose.Schema(
  {
    username: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
    },
  },
  { timestamps: true }
);

// Create the User model
const User: Model<IUser> = mongoose.model<IUser>("User", userSchema);

export default User;
