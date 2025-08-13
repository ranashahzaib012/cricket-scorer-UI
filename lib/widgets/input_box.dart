import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Plain InputBox (only padding)
class InputBox extends StatelessWidget {
  final Widget child;
  const InputBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // Space around the child
      child: child,
    );
  }
}

// Styled InputBox (renamed to NInputBox)
class NInputBox extends StatelessWidget {
  final Widget child;
  const NInputBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: child,
    );
  }
}
