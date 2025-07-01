import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  const MyCustomButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
