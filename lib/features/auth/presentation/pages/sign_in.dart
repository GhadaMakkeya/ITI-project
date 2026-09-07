import 'package:flutter/material.dart';
import 'package:iti_grad_project/core/constants/app_assets.dart';
import 'package:iti_grad_project/core/constants/app_strings.dart';
import 'package:iti_grad_project/core/constants/app_styles.dart';
import 'package:iti_grad_project/core/widgets/custom_text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In", style: AppStyles.black16roboto400)),

      body: Column(
        children: [
          Image.asset(AppAssets.offer),
          SizedBox(height: 62),
          CustomTextField(hintText: "Enter your name"),
          SizedBox(height: 25),
          CustomTextField(hintText: "Enter your password"),
          SizedBox(height: 70),
          Row(children: [Text("Remember me"), Text("Forgot password")]),
        ],
      ),
    );
  }
}
