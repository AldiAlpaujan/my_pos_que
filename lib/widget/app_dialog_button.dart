import 'package:flutter/material.dart';

class AppDialogButton extends StatelessWidget {
  final String label;
  final Color colorBtn;
  final Color shadow;
  final Function()? onTap;
  const AppDialogButton({
    super.key,
    required this.label,
    required this.colorBtn,
    required this.shadow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        decoration: BoxDecoration(
          color: colorBtn,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              color: shadow,
              offset: const Offset(0, 4),
            ),
            const BoxShadow(
              blurRadius: 32,
              color: Color.fromRGBO(0, 0, 0, 0.10),
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
