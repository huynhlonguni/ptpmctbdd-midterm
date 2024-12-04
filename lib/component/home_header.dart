import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/user.dart';

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
                  color:
                      Theme.of(context).colorScheme.onSecondary,
                  fontSize: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.fontSize),
            ),
            Text(
              user.username,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.fontSize,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/cart.svg",
                height: 24, width: 24),
            const SizedBox(width: 20),
            SvgPicture.asset("assets/svgs/profile.svg",
                height: 24, width: 24),
          ],
        )
      ],
    );
  }
}
