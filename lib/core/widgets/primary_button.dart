import 'package:flutter/material.dart';
import 'package:iti_grad_project/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const PrimaryButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 362,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
