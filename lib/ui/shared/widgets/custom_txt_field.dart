import 'package:flutter/material.dart';
import 'package:note_taker/ui/shared/constants/app_style.dart';
import 'package:note_taker/ui/shared/constants/border_radius.dart';
import 'package:note_taker/ui/shared/constants/colors_style.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.labelText,
    this.isValidationMessage = false,
    this.validationMessage,
    required this.inputController,
    this.suffixIcon = false,
    this.resize = false,
  });
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool isValidationMessage;
  final String? validationMessage;
  final TextEditingController inputController;
  final bool suffixIcon;
  final bool resize;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordvisibility = false;
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: knormalBorderRadius,
      borderSide: BorderSide(color: Color(kDarkGrey.value), width: 1.5),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: kminiMediumBorderRadius,
      borderSide: BorderSide(color: Color(kDarkRed.value), width: 1.5),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: widget.labelText ?? '',
          style: appMStyle(
            17,
            Color(kDark.value),
            FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: widget.inputController,
          keyboardType: widget.keyboardType,
          obscureText: widget.suffixIcon == true ? !passwordvisibility : false,
          style: appMStyle(
            17,
            Color(kDark.value),
            FontWeight.w500,
          ),
          validator: widget.validator,
          decoration: InputDecoration(
            prefixIcon: widget.resize
                ? Icon(
                    Icons.search,
                    color: Color(kDark.value),
                  )
                : null,
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon
                ? IconButton(
                    onPressed: () => setState(
                      () => passwordvisibility = !passwordvisibility,
                    ),
                    icon: Icon(
                      passwordvisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color(kDark.value),
                      size: 18,
                    ),
                  )
                : null,
            hintStyle: appMStyle(17, Color(kDark.value), FontWeight.w500),
            disabledBorder: inputBorder,
            enabledBorder: inputBorder,
            focusedErrorBorder: errorBorder,
            errorBorder: errorBorder,
            focusedBorder: inputBorder,
          ),
        ),
        ReusableText(
          text: widget.isValidationMessage == true
              ? widget.validationMessage ?? ''
              : '',
          style: appMStyle(17, Color(kBrightRed.value), FontWeight.w500),
        )
      ],
    );
  }
}
