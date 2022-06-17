import 'package:flutter/material.dart';
import 'package:mini_feed_project/components/auth/login_form.dart';
import 'package:mini_feed_project/components/auth/signup_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var _selectedIndex = 0;
  var _widgetOptions = <Widget>[];

  @override
  void initState() {
    _widgetOptions = [
      LoginForm(
        onBottomTextButtonPressed: _onBottomTextButtonTapped,
      ),
      SignUpForm(
        onBottomTextButtonPressed: _onBottomTextButtonTapped,
      )
    ];
    super.initState();
  }

  void _onBottomTextButtonTapped() => setState(
      () => _selectedIndex = (_selectedIndex + 1) % _widgetOptions.length);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _selectedIndex,
      children: _widgetOptions,
    );
  }
}
