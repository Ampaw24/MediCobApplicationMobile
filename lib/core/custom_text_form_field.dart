import 'package:flutter/material.dart';
import 'package:newmedicob/core/spec/string.dart';

import 'colors.dart';
import 'textstyles.dart';
import 'theme/custom_text_style.dart';
import 'theme/theme_helper.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    thisintText,
    thisintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.validate = true,
    this.validateEmail = false,
    this.validateMsg,
  });

  final Alignment? alignment;
  bool validate;
  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;
  String? validateMsg;
  final Widget? suffix;

  final BoxConstraints? suffixConstraints;
  bool validateEmail;
  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          textAlign: TextAlign.start,
          cursorHeight: 18,
          cursorColor: PRIMARYLIGHT,
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus!,
          style: textStyle ?? subheaderText,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: (value) {
            RegExp regex = RegExp(PATTERN);
            if (value!.isEmpty && validate) {
              return validateMsg;
            } else if (validateEmail && !regex.hasMatch(value)) {
              return "Please enter a valid email address";
            }
            return null;
          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        errorStyle: TextStyle(
          color: SLIDERED,
        ),
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.headlineSmallPrimary,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? const EdgeInsets.all(10),
        fillColor: fillColor ?? appTheme.lightBlue50,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: theme.colorScheme.primary.withOpacity(1),
                width: 0.5,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: theme.colorScheme.primary.withOpacity(1),
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: PRIMARYLIGHT,
                width: 1,
              ),
            ),
      );
}
