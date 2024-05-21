import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(size.width, size.height); // Move to the bottom-right corner
    path.lineTo(size.width, 0); // Move to the top-right corner
    path.lineTo(size.width / 2 + 30, 0); // Move to the top-middle point
    path.quadraticBezierTo(
        size.width / 2, 30, size.width / 2 - 30, 0); // Add a curve
    path.lineTo(0, 0); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
