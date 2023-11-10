// ignore_for_file: file_names

import 'package:gweiland_flutter_task/utils/common_exports.dart';

class BottomRoundedCornersClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 20); // Top-left corner
    path.quadraticBezierTo(0, 0, 20, 0); // Top-left corner
    path.lineTo(size.width - 20, 0); // Top-right corner
    path.quadraticBezierTo(size.width, 0, size.width, 20); // Top-right corner
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
