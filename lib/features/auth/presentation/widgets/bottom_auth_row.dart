import 'package:flutter/material.dart';

class BottomAuthRow extends StatelessWidget {
  final String question;
  final String action;
  final void Function()? onTap;
  const BottomAuthRow({
    super.key,
    required this.question,
    required this.action,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(question, style: TextStyle(decoration: TextDecoration.underline)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            action,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
