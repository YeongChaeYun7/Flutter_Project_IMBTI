import 'package:flutter/material.dart';
import 'package:imbti/styles/app_colors.dart';
import 'package:imbti/styles/app_text_style.dart';

class MainButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color? color;
  final String buttonText;
  const MainButton({
    super.key,
    required this.onTap,
    this.color,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 230,
        height: 50,
        decoration: BoxDecoration(
          color: color ?? AppColors.p3Color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.header20(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
