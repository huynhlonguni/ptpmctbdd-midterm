import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:midterm_flutter/screen/cart.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool disableBackButton;
  final bool disableCartButton;

  const CustomAppBar({
    super.key,
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
                icon: SvgPicture.asset(
                  "assets/svgs/ArrowLeft.svg",
                  height: 24,
                  width: 24,
                ),
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
                  "Details",
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
                icon: SvgPicture.asset(
                  "assets/svgs/Cart.svg",
                  height: 24,
                  width: 24,
                ),
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

