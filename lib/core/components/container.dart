import 'package:flutter/material.dart';

class DynamicContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;

  const DynamicContainer({
    Key? key,
    this.height,
    this.width,
    required this.backgroundColor,
    this.borderRadius,
    required this.child,
    this.margin,
    this.padding,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
      ),
      child: child,
    );
  }
}
