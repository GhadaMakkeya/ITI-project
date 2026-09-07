import 'package:flutter/material.dart';
import 'package:iti_grad_project/features/auth/presentation/pages/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const SignIn(),
    );
  }
}
