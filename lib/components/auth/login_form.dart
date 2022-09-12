import 'package:flutter/material.dart';
import 'package:mini_feed_project/components/auth/base_form.dart';
import 'package:mini_feed_project/components/auth/custom_fields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.onBottomTextButtonPressed})
      : super(key: key);

  final void Function() onBottomTextButtonPressed;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return AuthForm(
        title: "Log In",
        bottomText: "Don't have an account yet? Sign Up!",
        onSubmitButtonPressed: () {
          print("Login: $_username | $_password");
        },
        formFields: [
          WrappedTitle(
              title: "Username",
              child: UsernameFormField(
                onValidation: (username) => _username = username,
              )),
          WrappedTitle(
              title: "Password",
              child: PasswordFormField(
                onValidation: (password) => _password = password,
              ))
        ],
        onBottomTextButtonPressed: widget.onBottomTextButtonPressed);
  }
}
