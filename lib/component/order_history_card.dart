import 'package:flutter/material.dart';
import '../model/order.dart';
import 'svg.dart';
import 'package:intl/intl.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order order;

  const OrderHistoryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final String time = DateFormat('d MMMM | h:mm a').format(order.time);
    final Color color = !order.isCompleted
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.surfaceDim;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                Row(
    
                  children: [
                    SVG("assets/svgs/Cup.svg", size: 14, color: color),
                    const SizedBox(width: 10),
                    Text(order.coffee.name,
                        style: TextStyle(
                            color: color,
                            fontSize: 10,
                            fontWeight: FontWeight.w600))
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Text('\$${(order.price).toStringAsFixed(2)}',
                  style: TextStyle(
                      color: color, fontSize: 16, fontWeight: FontWeight.w600)),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SVG("assets/svgs/Location.svg", size: 14, color: color),
            const SizedBox(width: 10),
            Text(order.address,
                style: TextStyle(
                    color: color, fontSize: 10, fontWeight: FontWeight.w600))
          ],
        )
      ],
    );
  }
}
