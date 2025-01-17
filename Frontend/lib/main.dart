import 'package:chat_app/core/chat_page.dart';
import 'package:chat_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:chat_app/features/auth/data/repositories/auth_repo_imp.dart';
import 'package:chat_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/pages/login_page.dart';
import 'package:chat_app/core/messages_page.dart';
// import 'package:chat_app/features/auth/presentation/pages/register_page.dart';
import 'package:chat_app/core/theme.dart';
import 'package:chat_app/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final authRepository =
      AuthRepoImp(authRemoteDataSources: AuthRemoteDataSources());
  runApp(MainApp(authRepository: authRepository));
}

class MainApp extends StatelessWidget {
  final AuthRepoImp authRepository;
  const MainApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
              registerUseCase: RegisterUseCase(repository: authRepository),
              loginUseCase: LoginUseCase(repository: authRepository)),
        )
      ],
      child: MaterialApp(
        title: 'Chat-application',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const RegisterPage(),
        routes: {
          'login': (_) => LoginPage(),
          'register': (_) => RegisterPage(),
          'message': (_) => MessagesPage(),
          'chat': (_) => ChatPage(),
        },
      ),
    );
  }
}
