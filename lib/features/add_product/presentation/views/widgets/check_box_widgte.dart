import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
          activeColor: Colors.green,
          value: isChecked,
          onChanged: (value) {
            isChecked = value!;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        Text('Is featured item?!'),
      ],
    );
  }
}
