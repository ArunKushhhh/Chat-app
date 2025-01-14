import express from "express";

//controllers
import {register, login} from '../controllers/authController'

//middlewares

const router = express.Router();

router.post('/register', register);
router.post('/login', login);


export default router;
