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
        formFields: [
          WrappedTitle(
              title: "Username",
              child: TextFormField(
                decoration: authFieldsDecoration,
              )),
          const WrappedTitle(title: "Password", child: PasswordFormField()),
          const WrappedTitle(title: "Birthday", child: DateFormField())
        ],
        onBottomTextButtonPressed: onBottomTextButtonPressed);
  }
}
