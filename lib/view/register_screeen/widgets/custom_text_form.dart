import 'package:flutter/material.dart';

import '../../const/const.dart';

class CustomTextformWidget extends StatelessWidget {
  const CustomTextformWidget({
    Key? key,
    required this.textController,
    required this.validator,
    required this.lebelText,
    required this.textinputType,
    this.prefix,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController textController;
  final FormFieldValidator validator;
  final String lebelText;
  final Widget? prefix;
  final TextInputType textinputType;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
        keyboardType: textinputType,
        controller: textController,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: appGrey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: appGrey),
          ),

          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(lebelText),
          ),
          prefix: prefix,
          labelStyle: const TextStyle(color: appBlack, fontSize: 15),
          // fillColor: appBackground,
          // focusColor: appBackground,
          // filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
