import 'package:flutter/material.dart';
import '../model/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(order.coffee.image, height: 64),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.coffee.name,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.fontSize)),
                      Text(
                          '${order.shot.toLowerCase()} | ${order.temperature.toLowerCase()} | ${order.size.toLowerCase()}${order.temperature.toLowerCase() == 'hot' ? '' : ' | ${order.ice.toLowerCase()}'}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.fontSize)),
                    ],
                  ),
                  Text('x${order.quantity}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.fontSize)),
                ],
              ),
            ],
          ),
          Text('\$${(order.price).toStringAsFixed(2)}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize)),
        ],
      ),
    );
  }
}
