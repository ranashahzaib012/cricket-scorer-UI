import 'package:flutter/material.dart';

enum ButtonType {
  elevated,
  outlined,
  textButton,
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final ButtonType type;
  final double radius;

  const CustomButton({
    super.key,
    required this.color,
    required this.label,
    this.radius = 28.0,

    required this.onPressed,
    this.type = ButtonType.elevated,
    required Color textColor, // Default to elevated
  });

  @override
  Widget build(BuildContext context) {
    final commonStyle = ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
    );

    if (type == ButtonType.elevated) {
      return ElevatedButton(
        style: commonStyle.copyWith(
          backgroundColor: WidgetStateProperty.all(color),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      );
    }

    else if(type == ButtonType.textButton){
      return TextButton(
        style: commonStyle.copyWith(
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 14, color: color),
        ),
      );
    }
    else {
      return OutlinedButton(
        style: commonStyle.copyWith(
          side: WidgetStateProperty.all(BorderSide(color: color, width: 2)),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 16, color: color),
        ),
      );
    }
  }
}
