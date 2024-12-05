import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/theme.dart';
import '../model/user.dart';
import '../screen/cart.dart';
import '../screen/profile.dart';
import 'svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
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
              icon: theme.isDarkMode ? SVG("assets/svgs/Sun.svg", size: 24, color: Theme.of(context).colorScheme.onSurface) : SVG("assets/svgs/Moon.svg", size: 24, color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                theme.toggleTheme();
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: SVG("assets/svgs/Cart.svg", size: 24, color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: SVG("assets/svgs/Profile.svg", size: 24, color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
