import 'package:chat_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/features/auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthInputField(
                hint: 'Email',
                icon: Icons.email,
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              AuthInputField(
                hint: 'Password',
                icon: Icons.lock,
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              AuthButton(
                onPressed: () {},
                text: 'Login',
              ),
              const SizedBox(height: 10),
              LoginPrompt(
                  onTap: () {},
                  title: 'Do not have an account? ',
                  subtitle: 'Register Here'),
            ],
          ),
        ),
      ),
    );
  }
}
