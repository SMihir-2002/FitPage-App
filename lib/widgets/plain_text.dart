import 'package:fitpage/constants/text_styles.dart';
import 'package:flutter/material.dart';

class PlainText extends StatelessWidget {
  const PlainText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.heading,
    );
  }
}
