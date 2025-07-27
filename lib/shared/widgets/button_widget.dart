import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final VoidCallback? onPressed;
  final bool fullscreen;
  final int? width;
  final int? height;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.child,
    this.icon,
    this.iconAlignment = IconAlignment.end,
    this.onPressed,
    this.fullscreen = false,
    this.width,
    this.height,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
      iconAlignment: iconAlignment,
      icon: icon,
      label: child,
    );

    return SizedBox(
      width: fullscreen ? double.infinity : (width?.toDouble()),
      height: height?.toDouble(),
      child: button,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final VoidCallback? onPressed;
  final bool fullscreen;
  final int? width;
  final int? height;
  final double borderRadius;

  const SecondaryButton({
    super.key,
    required this.child,
    this.icon,
    this.iconAlignment = IconAlignment.end,
    this.onPressed,
    this.fullscreen = false,
    this.width,
    this.height,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
      onPressed: onPressed,
      child: child,
    );

    return SizedBox(
      width: fullscreen ? double.infinity : (width?.toDouble()),
      height: height?.toDouble(),
      child: button,
    );
  }
}

class NeutralButton extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final VoidCallback? onPressed;
  final bool fullscreen;
  final int? width;
  final int? height;
  final double borderRadius;

  const NeutralButton({
    super.key,
    required this.child,
    this.icon,
    this.iconAlignment = IconAlignment.end,
    this.onPressed,
    this.fullscreen = false,
    this.width,
    this.height,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final button = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF5F5F5),
          foregroundColor: isDark ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
      onPressed: onPressed,
      icon: icon,
      label: child,
    );

    return SizedBox(
      width: fullscreen ? double.infinity : (width?.toDouble()),
      height: height?.toDouble(),
      child: button,
    );
  }
}
