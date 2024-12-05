import 'package:flutter/material.dart';
import '../model/order.dart';
import 'package:intl/intl.dart';

class RewardCard extends StatelessWidget {
  final Order order;

  const RewardCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final String time = DateFormat('d MMMM | h:mm a').format(order.time);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(order.coffee.name,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Text(time,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text('+${(order.price.toInt())} Pts',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
