import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String dropdownValue;
  final List<String> dropdownOptions;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.dropdownValue,
    required this.dropdownOptions,
    required this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: widget.onChanged,
      items: widget.dropdownOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
