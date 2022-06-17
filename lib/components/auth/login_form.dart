import 'package:flutter/material.dart';
import 'package:mini_feed_project/components/auth/base_form.dart';
import 'package:mini_feed_project/components/auth/custom_fields.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key, required this.onBottomTextButtonPressed})
      : super(key: key);

  final void Function() onBottomTextButtonPressed;

  final _title = "Login";
  final _bottomText = "Don't have an account yet? Sign Up!";
  final _formFields = const [
    AuthTextFormField(fieldName: "Username"),
    AuthTextFormField(fieldName: "Password")
  ];

  @override
  Widget build(BuildContext context) {
    return AuthForm(
        title: _title,
        bottomText: _bottomText,
        formFields: _formFields,
        onBottomTextButtonPressed: onBottomTextButtonPressed);
  }
}
