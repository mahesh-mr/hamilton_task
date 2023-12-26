import 'package:flutter/material.dart';

import '../../const/const.dart';

class LoginTextformWidget extends StatelessWidget {
  const LoginTextformWidget({
    Key? key,
    required this.textController,
    required this.validator,
    required this.hintText,
    required this.textinputType,
    required this.prefixIcon,
  }) : super(key: key);

  final TextEditingController textController;
  final FormFieldValidator validator;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType textinputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: textinputType,
        controller: textController,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(10),
            // borderSide: const BorderSide(color: appGrey)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(10),
            // borderSide: const BorderSide(color: appGrey),
          ),
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: appDarkGrey,
          hintText: hintText,
          labelStyle: const TextStyle(color: appBlack, fontSize: 15),
          fillColor: appBackground,
          focusColor: appBackground,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
