import 'package:flutter/material.dart';
import 'package:my_architect/component/custom_textformfield.dart';

class UserComponent {
  static Padding formUser(
    String title, {
    String hint,
    TextEditingController controller,
    TextInputType type,
    Widget suffix,
    Widget prefix,
    int maxLines,
    int minLines,
    String desc,
    TextInputAction action,
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          desc == null ? Container() : Text(desc),
          SizedBox(height: 10),
          CustomTextFormfield(
            action: action == null ? TextInputAction.done : action,
            hint: hint,
            prefix: prefix ?? prefix,
            suffix: suffix ?? suffix,
            minLines: minLines,
            maxLines: maxLines,
            keyboardType: type,
            obscureText: obscure,
            controller: controller,
            validator: (val) {
              if (val.isEmpty) {
                return "$title tidak boleh kosong";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
