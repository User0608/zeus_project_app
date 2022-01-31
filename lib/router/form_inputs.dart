import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String? hintText;
  String? title;
  String? helperText;
  bool? isPassword;
  Function(String value)? onChangeValue;
  Input(
      {this.helperText,
      this.hintText,
      this.title,
      this.onChangeValue,
      this.isPassword});
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      obscureText: isPassword ?? false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        // counter: Text('${_nombre.length}'),
        hintText: hintText ?? '',
        labelText: title ?? '',
        helperText: helperText ?? '',
        suffixIcon: const Icon(Icons.accessibility),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      onChanged: (value) => {
        if (onChangeValue != null) {onChangeValue!(value)}
      },
    );
  }
}
