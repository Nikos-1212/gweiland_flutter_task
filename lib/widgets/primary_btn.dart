import 'package:flutter/material.dart';
import 'package:gweiland_flutter_task/values/constants.dart';

class GradientPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final List<Color> linearcolors;
  final Color? buttonColor;
  final Color textColor;
  const GradientPrimaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height = 56,
      this.linearcolors = AppConstants.btnBorderGradient,
      this.buttonColor,
      required this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonColor,
        gradient: const LinearGradient(
          colors: AppConstants
              .btnBorderGradient, // Customize your gradient colors here
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius:
            BorderRadius.circular(30.0), // Adjust border radius as neededborde
      ),
      child: MaterialButton(
        textColor: textColor, // Text color,
        height: height,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }
}
