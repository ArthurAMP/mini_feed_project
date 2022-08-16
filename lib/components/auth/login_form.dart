import 'package:flutter/material.dart';
import 'package:mini_feed_project/components/auth/base_form.dart';
import 'package:mini_feed_project/components/auth/custom_fields.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key, required this.onBottomTextButtonPressed})
      : super(key: key);

  final void Function() onBottomTextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AuthForm(
        title: "Log In",
        bottomText: "Don't have an account yet? Sign Up!",
        formFields: [
          WrappedTitle(
              title: "Username",
              child: TextFormField(
                decoration: authFieldsDecoration,
              )),
          const WrappedTitle(title: "Password", child: PasswordFormField()),
        ],
        onBottomTextButtonPressed: onBottomTextButtonPressed);
  }
}
