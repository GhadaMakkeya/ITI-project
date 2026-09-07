import 'package:flutter/material.dart';
import 'package:iti_grad_project/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;

  const PrimaryButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 362,
      width: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(fontSize: 16),),
      ),
    );
  }
}
