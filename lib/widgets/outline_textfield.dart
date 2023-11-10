import 'package:flutter/material.dart';
import 'package:gweiland_flutter_task/values/constants.dart';

class OutlineTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String)? onSubmitted;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;

  const OutlineTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      cursorColor: AppConstants.lightgrey,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefix: prefix,
        focusColor: AppConstants.darkAccent.withOpacity(0.5),
        prefixIcon: prefixIcon,
        suffix: suffix,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
            fontSize: 13,
            color: AppConstants.darkAccent.withOpacity(0.3),
            fontWeight: FontWeight.w500),
        contentPadding: const EdgeInsets.symmetric(horizontal: 23),
        fillColor: AppConstants.lightgrey,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

// // Example Usage:
// OutlineTextField(
//   labelText: 'Username',
//   hintText: 'Enter your username',
//   controller: TextEditingController(),
// );

// OutlineTextField(
//   labelText: 'Password',
//   hintText: 'Enter your password',
//   obscureText: true,
//   controller: TextEditingController(),
// );
