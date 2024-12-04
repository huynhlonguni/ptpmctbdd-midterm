import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final Widget child; // The icon as a child widget
  final VoidCallback onPressed;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;

  const TabButton({
    required this.child,
    required this.onPressed,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed, // Call the passed-in function when pressed
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            isActive ? activeColor : inactiveColor,
            BlendMode.srcIn, // Apply the color filter to the icon
          ),
          child: child, // The child widget is the icon
        ),
      ),
    );
  }
}
