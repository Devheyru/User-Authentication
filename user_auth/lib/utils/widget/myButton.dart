import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onTab;
  final String buttonText;
  final Color color;
  const MyButton({
    super.key,
    required this.onTab,
    required this.buttonText,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTab,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
