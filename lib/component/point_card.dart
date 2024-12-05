import 'package:flutter/material.dart';

import '../model/user.dart';
import '../screen/redeem.dart';

class PointCard extends StatelessWidget {
  const PointCard({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Points",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                user.points.toString(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF476374),
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
              style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Redeem(), // Pass the selected coffee
                  ),
                );
              },
              child: const Text("Redeem drinks", style: TextStyle(color: Color(0xFFCED6DB), fontSize: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
