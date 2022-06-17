import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({Key? key, required this.fieldName, this.controller})
      : super(key: key);

  final String fieldName;
  final TextEditingController? controller;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  static const _titleStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      children: [
        Text(
          widget.fieldName,
          style: _titleStyle,
        ),
        TextFormField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          controller: widget.controller,
        ),
      ],
    );
  }
}
