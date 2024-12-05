import 'package:flutter/material.dart';
import '../screen/cart.dart';
import 'svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final bool disableBackButton;
  final bool disableCartButton;

  const CustomAppBar({
    super.key,
    this.title = "",
    this.height = kToolbarHeight,
    this.disableBackButton = false,
    this.disableCartButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left side (Leading icon)
            if (!disableBackButton && Navigator.canPop(context)) 
              IconButton(
                icon: const SVG("assets/svgs/ArrowLeft.svg", size: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            if (disableBackButton || !Navigator.canPop(context))
              const SizedBox(width: 40), // Add empty space when back button is hidden

            // Center (Title)
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),

            // Right side (Action icon)
            if (!disableCartButton)
              IconButton(
                icon: const SVG("assets/svgs/Cart.svg", size: 24),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
              ),
            if (disableCartButton)
              const SizedBox(width: 40), // Add empty space when cart button is hidden
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

