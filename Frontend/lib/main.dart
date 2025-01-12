import 'package:chat_app/core/chat_page.dart';
import 'package:chat_app/core/login_page.dart';
import 'package:chat_app/core/messages_page.dart';
import 'package:chat_app/core/register_page.dart';
import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat-application',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
