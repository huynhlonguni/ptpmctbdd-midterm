import 'package:flutter/material.dart';
import '../component/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../model/cart.dart';
import '../model/order.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    return Scaffold(
        appBar: const CustomAppBar(title: "Cart", disableCartButton: true),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: Builder(builder: (context) {
            if (cart.items.isEmpty) {
              return const Center(child: Text("No items in the cart"));
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final order = cart.items[index];
                  return OrderCard(order: order);
                },
              );
            }
          }),
        ));
  }
}

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
                          '${order.shot.toLowerCase()} | ${order.temperature.toLowerCase()} | ${order.size.toLowerCase()} | ${order.shot.toLowerCase()}',
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
