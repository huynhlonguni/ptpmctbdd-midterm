import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../component/custom_app_bar.dart';
import '../component/seperator.dart';
import '../component/svg.dart';
import '../model/cart.dart';
import '../model/coffee.dart';
import '../model/order.dart';
import '../screen/cart.dart';

class Detail extends StatefulWidget {
  final Coffee coffee;

  const Detail({super.key, required this.coffee});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int quantity = 1;
  String shot = "Single";
  String temperature = "Hot";
  String size = "Medium";
  String ice = "Normal Ice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Details"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero transition for coffee image
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: Hero(
                      tag: widget.coffee.image,
                      child: Image.asset(widget.coffee.image, height: 100)),
                ),
                const SizedBox(height: 32),
                // Coffee Name and Quantity Counter
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.coffee.name,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.fontSize),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                                borderRadius: BorderRadius.circular(100)),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      size: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.fontSize),
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                ),
                                Text('$quantity',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.fontSize)),
                                IconButton(
                                  icon: Icon(Icons.add,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      size: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.fontSize),
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Seperator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shot",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.fontSize),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildOptionButton(shot, "Single", () {
                                setState(() {
                                  shot = "Single";
                                });
                              }),
                              const SizedBox(width: 8),
                              _buildOptionButton(shot, "Double", () {
                                setState(() {
                                  shot = "Double";
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                      const Seperator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.fontSize),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildIconOption(temperature, "Hot",
                                  "assets/svgs/HotDrink.svg", 28),
                              const SizedBox(width: 32),
                              _buildIconOption(temperature, "Iced",
                                  "assets/svgs/IceDrink.svg", 34),
                            ],
                          ),
                        ],
                      ),
                      const Seperator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.fontSize),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildIconOption(size, "Small",
                                  "assets/svgs/DrinkSmall.svg", 22),
                              const SizedBox(width: 28),
                              _buildIconOption(size, "Medium",
                                  "assets/svgs/DrinkMedium.svg", 32),
                              const SizedBox(width: 28),
                              _buildIconOption(size, "Large",
                                  "assets/svgs/DrinkLarge.svg", 40),
                            ],
                          ),
                        ],
                      ),
                      const Seperator(),
                      Builder(builder: (context) {
                        if (temperature == "Iced") {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ice",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.fontSize),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  _buildIconOption(ice, "Little Ice",
                                      "assets/svgs/IceSmall.svg", 14),
                                  const SizedBox(width: 26),
                                  _buildIconOption(ice, "Normal Ice",
                                      "assets/svgs/IceMedium.svg", 20),
                                  const SizedBox(width: 26),
                                  _buildIconOption(ice, "Full Ice",
                                      "assets/svgs/IceLarge.svg", 30),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),

            // Total Amount and Add to Cart Button
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.fontSize),
                    ),
                    Text(
                        "\$${(quantity * widget.coffee.price[size]!).toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontSize)), // Assuming price per coffee is $5
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20)),
                      onPressed: () {
                        final order = Order(
                            coffee: widget.coffee,
                            quantity: quantity,
                            shot: shot,
                            temperature: temperature,
                            size: size,
                            ice: ice,
                            price: quantity * widget.coffee.price[size]!);
                        Provider.of<CartModel>(context, listen: false)
                            .addItem(order);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Cart()),
                        );
                      },
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontSize),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
      String currentSelection, String label, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
          color: currentSelection == label
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          border: Border.all(
              color: currentSelection == label
                  ? Colors.transparent
                  : Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(100)),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
        onPressed: onPressed,
        child: Text(label,
            style: TextStyle(
                color: currentSelection == label
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurface)),
      ),
    );
  }

  Widget _buildIconOption(
      String currentSelection, String label, String iconPath, double width) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          if (label == "Hot" || label == "Iced") {
            temperature = label;
          } else if (label == "Small" ||
              label == "Medium" ||
              label == "Large") {
            size = label;
          } else if (label == "Little Ice" ||
              label == "Normal Ice" ||
              label == "Full Ice") {
            ice = label;
          }
        });
      },
      child: SVG(iconPath, 
        height: width,
        width: width,
        color: currentSelection == label
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onSecondary),
    );
  }
}
