
import 'package:flutter/material.dart';

class IsOrganicWidget extends StatefulWidget {
  const IsOrganicWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicWidget> createState() => _IsOrganicWidgetState();
}

class _IsOrganicWidgetState extends State<IsOrganicWidget> {
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
        Text('Is organic item?!'),
      ],
    );
  }
}
