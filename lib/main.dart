import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti_grad_project/features/auth/presentation/pages/sign_up_page.dart';
import 'package:iti_grad_project/features/home/presentation/pages/home_page.dart';
import 'package:iti_grad_project/features/search/custom_bottom_nav_bar.dart';
import 'package:iti_grad_project/firebase_options.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
