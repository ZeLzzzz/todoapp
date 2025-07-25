import 'package:flutter/material.dart';
import 'package:todoapp/shared/themes/app_theme.dart';

class ButtonWidget extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  const ButtonWidget({super.key, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: child,
    );
  }
}
