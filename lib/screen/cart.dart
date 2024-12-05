import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:midterm_flutter/component/order_card.dart';
import '../component/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../model/cart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final double total = cart.items.fold(0, (sum, item) => sum + item.price);
    return Scaffold(
        appBar: const CustomAppBar(title: "Cart", disableCartButton: true),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
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
                        return SwipeActionCell(
                            key: ObjectKey(order),
                            trailingActions: [
                              SwipeAction(
                                  performsFirstActionWithFullSwipe: true,
                                  content: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        fit: BoxFit.none,
                                        "assets/svgs/Delete.svg",
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(
                                            Theme.of(context)
                                                .colorScheme
                                                .onError,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                  ),

                                  /// you should set the default  bg color to transparent
                                  color: Colors.transparent,
                                  onTap: (handler) async {
                                    await handler(true);
                                    cart.removeItem(index);
                                  }),
                            ],
                            child: OrderCard(order: order));
                      },
                    );
                  }
                }),
              ),
              Builder(builder: (context) {
                if (cart.items.isEmpty) {
                  return Container();
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Price",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.fontSize)),
                            Text('\$${(total).toStringAsFixed(2)}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize)),
                          ],
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0)),
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 28),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svgs/Cart.svg",
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.onPrimary,
                                        BlendMode.srcIn),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "Checkout",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.fontSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                }
              })
            ],
          ),
        ));
  }
}
