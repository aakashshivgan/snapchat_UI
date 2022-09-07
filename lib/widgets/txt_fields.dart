import 'package:flutter/material.dart';

class TextFieldsForScreen extends StatelessWidget {
  final String label;
  final FormFieldValidator validator;
  final Function(String) onChange;
  final TextInputType txtType;
  final bool obscure;

  const TextFieldsForScreen({
    Key? key,
    required this.label,
    required this.txtType,
    required this.onChange,
    required this.validator,
    required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: txtType,
        obscureText: obscure,
        validator: validator,
        onChanged: onChange,
        decoration: InputDecoration(
            labelText: label,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade500))));
  }
}
