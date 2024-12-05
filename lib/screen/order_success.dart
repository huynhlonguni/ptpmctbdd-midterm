import 'package:flutter/material.dart';
import '../state/tab_manager.dart';
import 'package:provider/provider.dart';

import '../component/svg.dart';

class OrderSuccess extends StatelessWidget {

  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SVG("assets/svgs/OrderSuccess.svg",
                size: 177, color: Theme.of(context).colorScheme.onSurface),
            const SizedBox(height: 32),
            Text("Order Success",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize:
                        Theme.of(context).textTheme.headlineSmall?.fontSize)),
            const SizedBox(height: 22),
            Text("Your order has been placed successfully.",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize:
                        Theme.of(context).textTheme.titleSmall?.fontSize)),
            Text("For more details, go to my orders.",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize:
                        Theme.of(context).textTheme.titleSmall?.fontSize)),
            const SizedBox(height: 80),
            TextButton(
                style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                onPressed: () {
                  final TabManager tabManager = Provider.of<TabManager>(context, listen: false);
                  tabManager.setTabIndex(2);
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        "Track My Order",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize:
                              Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )))
          ],
        ),
      )),
    );
  }
}
