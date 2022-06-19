import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(
      {Key? key,
      required this.title,
      required this.bottomText,
      required this.formFields,
      required this.onBottomTextButtonPressed})
      : super(key: key);

  final String title;
  final String bottomText;
  final List<Widget> formFields;
  final void Function() onBottomTextButtonPressed;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Wrap(
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Wrap(
                        runSpacing: 18,
                        alignment: WrapAlignment.center,
                        children: [
                          ...widget.formFields,
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(widget.title),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(200, 45)),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: widget.onBottomTextButtonPressed,
              child: Text(widget.bottomText))
        ],
      ),
    );
  }
}
