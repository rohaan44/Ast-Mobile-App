import 'dart:ui' show ImageFilter;

import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double? borderRadius;
  final Color? textColor;

  const GlassButton({
    super.key,
    this.textColor,
    this.borderRadius,
    required this.child,
    required this.onPressed,
    this.width = 180,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        children: [
          // Frosted glass background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(borderRadius ?? cw(12)),
                  // border: Border.all(
                  //   color: Colors.white.withOpacity(0.25),
                  //   width: 1.5,
                  // ),
                ),
                alignment: Alignment.center,
                child: child),
          ),

          // InkWell for tap animation
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                splashColor: Colors.white24,
                highlightColor: Colors.white10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
