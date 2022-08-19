import 'package:flutter/material.dart';

class FieldWidget extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final int type;
  late TextInputType _type;

  FieldWidget(
      {Key? key,
      required this.text,
      required this.controller,
      required this.type})
      : super(key: key) {
    if (type == 1) {
      _type = TextInputType.text;
    } else if (type == 2) {
      _type = TextInputType.number;
    }
  }

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(child: Text(widget.text)),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
              keyboardType: widget._type,
              controller: widget.controller), // <-- Wrapped in Expanded.
        ),
      ],
    );
  }
}
