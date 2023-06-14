import 'package:flutter/material.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.onTap,
    required this.color,
    this.textColor,
    this.loadingStatus = false,
  });
  final double? width;
  final double? height;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color? textColor;
  final bool loadingStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: loadingStatus ? Color(kDarkRed.value) : color,
          borderRadius: kmediumBorderRadius,
        ),
        child: ReusableText(
          text: text,
          style: appMStyle(
            20,
            textColor ?? Colors.white,
            FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
