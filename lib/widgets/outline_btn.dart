import 'package:flutter/cupertino.dart';
import 'package:gweiland_flutter_task/utils/common_exports.dart';

class GradientBorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final bool? isrightIcon;
  final IconData? rightIcon;
  final double? borderWidth;
  const GradientBorderButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height = 40,
      this.isrightIcon = false,
      this.rightIcon,
      this.borderWidth = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: AppColor.btnBorderGradient, // Customize your gradient colors here
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        borderRadius:
            BorderRadius.circular(30.0), // Adjust border radius as neededborde

        // border: Border.fromBorderSide(
        //     BorderSide(color: AppColor.appColor, width: borderWidth!))
      ),
      height: height,
      child: MaterialButton(
        height: height,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isrightIcon!) ...[
              Text(
                text,
                style: const TextStyle(
                  color: AppConstants.green, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Icon(
                rightIcon ?? CupertinoIcons.arrow_right,
                size: 20,
              )
            ] else ...[
              Text(
                text,
                style: const TextStyle(
                  color: AppConstants.green, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
