import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const authFieldsDecoration = InputDecoration(
    border: OutlineInputBorder(), fillColor: Colors.white, filled: true);

class DateFormField extends StatefulWidget {
  const DateFormField({Key? key, required this.onValidation}) : super(key: key);

  final void Function(DateTime birthDate) onValidation;

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  DateTime? _selectedDate;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _getDateFromUser(BuildContext context) async {
    _selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.utc(1900),
        lastDate: DateTime.now());
    _updateTextField();
  }

  void _updateTextField() {
    final dateText = _selectedDate != null
        ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
        : "";
    _controller.text = dateText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: authFieldsDecoration,
      controller: _controller,
      onTap: () => _getDateFromUser(context),
      readOnly: true,
      validator: (value) {
        if (_selectedDate == null || value == null || value.isEmpty) {
          return "Please, insert a birth date";
        }
        widget.onValidation(_selectedDate!);
        return null;
      },
    );
  }
}

class UsernameFormField extends StatefulWidget {
  const UsernameFormField({Key? key, required this.onValidation})
      : super(key: key);

  final void Function(String username) onValidation;

  @override
  State<UsernameFormField> createState() => _UsernameFormFieldState();
}

class _UsernameFormFieldState extends State<UsernameFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: authFieldsDecoration,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please, insert a username.";
        }
        widget.onValidation(value);
        return null;
      },
    );
  }
}

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({Key? key, required this.onValidation})
      : super(key: key);

  final void Function(String password) onValidation;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  var _isPasswordVisible = false;

  void _toggleVisibility() =>
      setState(() => _isPasswordVisible = !_isPasswordVisible);

  @override
  Widget build(BuildContext context) {
    final buttonIcon =
        _isPasswordVisible ? Icons.visibility_off : Icons.visibility;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            decoration: authFieldsDecoration,
            obscureText: !_isPasswordVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please, insert a password.";
              }
              widget.onValidation(value);
              return null;
            },
          ),
        ),
        IconButton(
            onPressed: _toggleVisibility,
            icon: Icon(
              buttonIcon,
              color: Theme.of(context).colorScheme.onBackground,
            ))
      ],
    );
  }
}

class WrappedTitle extends StatelessWidget {
  const WrappedTitle(
      {Key? key, required this.title, required this.child, this.spacing = 8.0})
      : super(key: key);

  final String title;
  final Widget child;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: spacing,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.onBackground),
        ),
        child,
      ],
    );
  }
}
