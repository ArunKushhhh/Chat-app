import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const AuthInputField(
      {super.key,
      required this.hint,
      required this.icon,
      required this.controller,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: DefaultColors.sentMessageInput,
          borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none),
            style: const TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
