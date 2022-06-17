import 'package:flutter/material.dart';
import 'package:mini_feed_project/components/auth/base_form.dart';
import 'package:mini_feed_project/components/auth/custom_fields.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key, required this.onBottomTextButtonPressed})
      : super(key: key);

  final void Function() onBottomTextButtonPressed;

  final _title = "Sign Up";
  final _bottomText = "Already have an account? Sign in!";
  final _formFields = const [
    AuthTextFormField(fieldName: "Email"),
    AuthTextFormField(fieldName: "Password"),
  ];

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: _title,
      bottomText: _bottomText,
      formFields: _formFields,
      onBottomTextButtonPressed: onBottomTextButtonPressed,
    );
  }
}
