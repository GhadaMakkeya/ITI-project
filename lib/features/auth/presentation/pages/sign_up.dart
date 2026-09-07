import 'package:flutter/material.dart';
import 'package:iti_grad_project/core/constants/app_assets.dart';
import 'package:iti_grad_project/core/constants/app_strings.dart';
import 'package:iti_grad_project/core/constants/app_styles.dart';
import 'package:iti_grad_project/core/widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up", style: AppStyles.black16roboto400)),
      body: Column(
        children: [
          Image.asset(AppAssets.offer),
          CustomTextField(hintText: "Enter your name"),
          CustomTextField(hintText: "Enter your password"),
          CustomTextField(hintText: "Confirm your password"),
        ],
      ),
    );
  }
}
