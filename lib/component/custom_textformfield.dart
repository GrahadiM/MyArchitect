import 'package:flutter/material.dart';
import 'package:my_architect/component/const.dart';

class CustomTextFormfield extends StatelessWidget {
  String hint;
  int maxLines;
  int minLines;
  bool enabled;
  Widget suffix;
  Widget prefix;
  bool obscureText;
  TextInputType keyboardType;
  TextEditingController controller;
  TextInputAction action;
  FormFieldValidator<String> validator;

  CustomTextFormfield({
    @required this.hint,
    @required this.controller,
    @required this.keyboardType,
    this.suffix,
    this.prefix,
    this.action,
    this.enabled = true,
    this.validator,
    this.maxLines = 1,
    this.minLines = 1,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: obscureText ? 1 : maxLines,
      minLines: obscureText ? null : minLines,
      validator: validator,
      controller: controller,
      textInputAction: action,
      obscureText: obscureText,
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: enabled ? null : Colors.grey.shade200,
        filled: !enabled,
        hintText: hint,
        prefix: prefix ?? prefix,
        suffixIcon: suffix ?? suffix,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: PRIMARY_COLOR),
        ),
      ),
    );
  }
}
