import 'package:flutter/material.dart';
import 'package:my_pos_que/widget/app_loading_btn.dart';

class AppButton extends StatelessWidget {
  final String label;
  final double? height;
  final double? width;
  final bool isLoading;
  final Widget? child;
  final Function() onPressed;
  const AppButton({
    super.key,
    required this.label,
    this.height,
    this.width,
    this.isLoading = false,
    this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 46,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child ?? defaultChild(),
      ),
    );
  }

  Widget defaultChild() => isLoading
      ? btnLoading()
      : Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        );

  Widget btnLoading() => const AppLoadingBtn();
}
