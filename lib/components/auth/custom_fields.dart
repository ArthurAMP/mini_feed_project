import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const authFieldsDecoration = InputDecoration(border: OutlineInputBorder());

class DateFormField extends StatefulWidget {
  const DateFormField({Key? key}) : super(key: key);

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
    );
  }
}

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({Key? key}) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  var _isPasswordVisible = false;

  void _toggleVisibility() =>
      setState(() => _isPasswordVisible = !_isPasswordVisible);

  @override
  Widget build(BuildContext context) {
    final _buttonIcon =
        _isPasswordVisible ? Icons.visibility_off : Icons.visibility;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            decoration: authFieldsDecoration,
            obscureText: !_isPasswordVisible,
          ),
        ),
        IconButton(onPressed: _toggleVisibility, icon: Icon(_buttonIcon))
      ],
    );
  }
}

class WrappedTitle extends StatelessWidget {
  static const _titleStyle = TextStyle(fontSize: 16);

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
          style: _titleStyle,
        ),
        child,
      ],
    );
  }
}
