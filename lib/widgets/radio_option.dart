import 'package:flutter/material.dart';

  class OptionSelector extends StatelessWidget {
  final String title;
  final String groupValue; // For Radio
  final String value; // For Radio
  final Function(String?)? onRadioChanged;
  final bool isSwitch;
  final bool switchValue;
  final Function(bool)? onSwitchChanged;

  const OptionSelector({
    super.key,
    this.title = '',
    this.groupValue = '',
    this.value = '',
    this.onRadioChanged,
    this.isSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isSwitch)
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onRadioChanged,
            activeColor: Colors.green,
          ),
        if (isSwitch)
          Switch(
            value: switchValue,
            onChanged: onSwitchChanged,
            activeTrackColor: Colors.green[200],
            activeColor: Colors.green,
          ),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
