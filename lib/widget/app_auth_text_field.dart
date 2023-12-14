import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_pos_que/theme/theme.dart';

class AppAuthTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;
  const AppAuthTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.controller,
  });

  @override
  State<AppAuthTextField> createState() => _AppAuthTextFieldState();
}

class _AppAuthTextFieldState extends State<AppAuthTextField> {
  final focusNode = FocusNode();
  final hasFocused = false.obs;
  final hideValue = false.obs;

  final iconColor = const Color(0xFF7A869A);
  @override
  void initState() {
    hideValue.value = widget.obscureText;
    focusNode.addListener(() {
      hasFocused.value = focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        focusNode: focusNode,
        controller: widget.controller,
        style: const TextStyle(
          color: AppTheme.bodyColor,
          fontWeight: FontWeight.w500,
        ),
        obscureText: hideValue.value,
        decoration: InputDecoration(
          isDense: true,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: iconColor),
          ),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          icon: icon(),
          suffixIcon: widget.obscureText ? suffixIcon() : null,
        ),
      ),
    );
  }

  Widget icon() => Container(
        height: 38,
        width: 24,
        color: Colors.transparent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => Icon(
                  widget.icon,
                  size: 22,
                  color: hasFocused.value ? AppTheme.primaryColor : iconColor,
                ),
              ),
            ),
          ],
        ),
      );
  Widget suffixIcon() => IconButton(
        onPressed: () => hideValue.value = !hideValue.value,
        icon: Obx(
          () => Icon(
            hideValue.value ? MdiIcons.eyeOffOutline : MdiIcons.eyeOutline,
            size: 22,
            color: hasFocused.value ? AppTheme.primaryColor : iconColor,
          ),
        ),
      );
}
