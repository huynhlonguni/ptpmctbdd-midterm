import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:provider/provider.dart';

import '../component/order_history_card.dart';
import '../component/seperator.dart';
import '../component/svg.dart';
import '../model/history.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<HistoryModel>(context);
    final onGoingOrders = history.items.asMap().entries.where((entry) => !entry.value.isCompleted).map((entry) => entry.key).toList();
    final completedOrders = history.items.asMap().entries.where((entry) => entry.value.isCompleted).map((entry) => entry.key).toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'My Order',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            dividerColor: Theme.of(context).colorScheme.outline,
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.onSurface,
            unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
            tabs: const [
              Tab(text: 'On going'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 104),
          child: TabBarView(
            children: [
              // On Going Tab
              Builder(builder: (context) {
                if (onGoingOrders.isEmpty) {
                  return const Center(child: Text("No on going order"));
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const Seperator(gapSize: 16),
                    itemCount: onGoingOrders.length,
                    itemBuilder: (context, index) {
                      final orderIndex = onGoingOrders[index];
                      final order = history.items[orderIndex];

                      return SwipeActionCell(
                          key: ObjectKey(order),
                          leadingActions: [
                            SwipeAction(
                                performsFirstActionWithFullSwipe: true,
                                content: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SVG("assets/svgs/Tick.svg",
                                        fit: BoxFit.none,
                                        size: 24,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary),
                                  ),
                                ),
                                color: Colors.transparent,
                                onTap: (handler) async {
                                  await handler(true);
                                  history.setItemStatus(orderIndex, true);
                                }),
                          ],
                          child: OrderHistoryCard(order: order));
                    },
                  );
                }
              }),

              // History Tab
              Builder(builder: (context) {
                if (completedOrders.isEmpty) {
                  return const Center(child: Text("No order history"));
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const Seperator(gapSize: 16),
                    itemCount: completedOrders.length,
                    itemBuilder: (context, index) {
                      final orderIndex = completedOrders[index];
                      final order = history.items[orderIndex];
                      if (!order.isCompleted) {
                        return Container();
                      }
                      return OrderHistoryCard(order: order);
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
