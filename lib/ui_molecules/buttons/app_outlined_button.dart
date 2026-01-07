import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.fontSize,
    this.borderRadius,
    this.fontWeight,
    this.fontFamily,
    this.padding,
    this.borderColor,
    this.textColor,
    this.showIcon = false,
    this.icon,
    this.iconSpacing = 8.0,
    this.buttonStyle,
  });

  final String? text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool isLoading;
  final Widget? child;
  final EdgeInsets? padding;
  final Color? borderColor;
  final Color? textColor;
  final bool showIcon;
  final Widget? icon;
  final double iconSpacing;
  final BoxDecoration? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed();
            },
      child: Container(
        alignment: Alignment.center,
        padding: padding ?? EdgeInsets.zero,
        width: width ?? (87.2).w,
        height: height ?? ch(56),
        decoration: buttonStyle ??
            BoxDecoration(
              borderRadius: BorderRadius.circular((borderRadius ?? 4.26).w),
              border: Border.all(
                width: (0.266).w,
                color: borderColor ?? AppColor.c1D1D1B,
              ),
              color: Colors.transparent,
            ),
        child: child ??
            (!isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Optional icon (centered with text)
                      if (showIcon && icon != null) ...[
                        icon!,
                        if (text != null) SizedBox(width: cw(iconSpacing)),
                      ],

                      if (text != null)
                        Text(
                          text!,
                          style: textStyle ??
                              TextStyle(
                                fontFamily: fontFamily ?? "SF-Pro",
                                fontSize: fontSize ?? AppFontSize.f16 - 1.5,
                                color: textColor ?? AppColor.c1D1D1B,
                                fontWeight: fontWeight ?? FontWeight.w600,
                                decoration: TextDecoration.none,
                                letterSpacing: 0,
                              ),
                        ),
                    ],
                  )
                : const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColor.c1D1D1B,
                    ),
                  )),
      ),
    );
  }
}
