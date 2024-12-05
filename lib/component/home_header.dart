import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/user.dart';
import '../screen/cart.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: Theme.of(context).textTheme.titleSmall?.fontSize),
            ),
            Text(
              user.username,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
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
            const SizedBox(width: 8),
            IconButton(
              icon: SvgPicture.asset(
                "assets/svgs/Profile.svg",
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
          ],
        )
      ],
    );
  }
}
