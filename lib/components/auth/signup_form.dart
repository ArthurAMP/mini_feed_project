import 'package:flutter/material.dart';
import 'package:mini_feed_project/components/auth/base_form.dart';
import 'package:mini_feed_project/components/auth/custom_fields.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key, required this.onBottomTextButtonPressed})
      : super(key: key);

  final void Function() onBottomTextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AuthForm(
        title: "Sign Up",
        bottomText: "Already have an account? Log In!",
        formFields: const [
          AuthTextFormField(fieldName: "Username"),
          AuthTextFormField(fieldName: "Password"),
          AuthTextFormField(fieldName: "Birthday"),
        ],
        onBottomTextButtonPressed: onBottomTextButtonPressed);
  }
}
