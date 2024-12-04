import 'package:flutter/material.dart';
import 'package:midterm_flutter/component/order_card.dart';
import '../component/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../model/cart.dart';

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
