import 'package:flutter/material.dart';
import '../model/coffee.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    super.key,
    required this.coffee,
    required this.onPressed,
  });

  final Coffee coffee;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: coffee.image,
                child: Image.asset(coffee.image, height: 80)),
            const SizedBox(height: 12),
            Text(
              coffee.name,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
