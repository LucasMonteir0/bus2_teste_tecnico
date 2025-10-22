import 'package:flutter/material.dart';

class UserDetailField extends StatefulWidget {
  final String label;
  final String value;
  final IconData? icon;
  final int maxLines;

  const UserDetailField({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.maxLines = 1,
  });

  @override
  State<UserDetailField> createState() => _UserDetailFieldState();
}

class _UserDetailFieldState extends State<UserDetailField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant UserDetailField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: textTheme.labelLarge),
        SizedBox(height: 4),
        TextFormField(
          controller: _controller,
          readOnly: true,
          maxLines: widget.maxLines,
          enableInteractiveSelection: true,
          decoration: InputDecoration(
            prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
