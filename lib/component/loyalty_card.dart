import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/user.dart';

class LoyaltyCard extends StatelessWidget {
  const LoyaltyCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
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
              Text(
                "${user.loyaltyProgress} / ${user.loyaltyTotal}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize),
              ),
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
                  return SvgPicture.asset(
                    "assets/svgs/CoffeeCup.svg",
                    width: 30,
                    height: 30,
                  );
                } else {
                  return SvgPicture.asset(
                    "assets/svgs/CoffeeCupGray.svg",
                    width: 30,
                    height: 30,
                  );
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
