import 'package:flutter/material.dart';
import 'package:midterm_flutter/model/coffee.dart';

class CoffeeList extends StatelessWidget {
  const CoffeeList({
    super.key,
    required this.coffeeModel,
  });

  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coffee List
            Text(
              "Choose your coffee",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: coffeeModel.coffees.length,
                itemBuilder: (context, index) {
                  final coffee = coffeeModel.coffees[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(coffee.image, height: 80),
                        const SizedBox(height: 12),
                        Text(
                          coffee.name,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.fontSize),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 104),
          ],
        ),
      ),
    );
  }
}
