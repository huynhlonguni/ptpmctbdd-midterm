import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import 'svg.dart';

class LoyaltyCard extends StatelessWidget {
  const LoyaltyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Loyalty Card",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize),
              ),
              Builder(builder: (context) {
                if (user.loyaltyProgress < user.loyaltyTotal) {
                  return Text(
                    "${user.loyaltyProgress} / ${user.loyaltyTotal}",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize:
                            Theme.of(context).textTheme.titleSmall?.fontSize),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(100)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20)),
                      onPressed: () {
                        user.redeemLoyalty();
                      },
                      child: Text(
                        "Flush Stamps",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.fontSize),
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(user.loyaltyTotal, (index) {
                if (index < user.loyaltyProgress) {
                  return const SVG("assets/svgs/CoffeeCup.svg", size: 30);
                } else {
                  return const SVG("assets/svgs/CoffeeCupGray.svg", size: 30);
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
