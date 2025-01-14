import express from "express";
import { json } from "body-parser";
import dotenv from "dotenv";
import authRoutes from "./routes/authRoutes";
import connectDB from "./models/db";

dotenv.config();
connectDB();

const server = express();
server.use(json());

server.use("/auth", authRoutes);
// server.get("/", (req: Request, res: Response) => {
//   console.log("test");
//   res.send("Yes it is working");
// });

const PORT = process.env.PORT || 3000;
server.listen(PORT || 3000, () =>
  console.log(`Server running on port: ${PORT}`)
);
