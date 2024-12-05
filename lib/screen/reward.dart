import 'package:flutter/material.dart';
import '../component/loyalty_card.dart';
import 'package:provider/provider.dart';
import '../component/point_card.dart';
import '../component/reward_card.dart';
import '../component/seperator.dart';
import '../model/history.dart';
import '../model/user.dart';

class Reward extends StatelessWidget {
  const Reward({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    final history = Provider.of<HistoryModel>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Rewards",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize:
                          Theme.of(context).textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const LoyaltyCard(),
                const SizedBox(height: 16),
                PointCard(user: user),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              "History Rewards",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Builder(builder: (context) {
                if (history.items.isEmpty) {
                  return const Center(child: Text("No reward history"));
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const Seperator(gapSize: 16),
                    itemCount: history.items.length,
                    itemBuilder: (context, index) {
                      final order = history.items[index];
                      return RewardCard(order: order);
                    },
                  );
                }
              }),
            ),
            const SizedBox(height: 104),
          ],
        ),
      ),
    );
  }
}
