import 'package:flutter/material.dart';
import '../component/coffee_list.dart';
import '../component/home_header.dart';
import '../component/loyalty_card.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import '../model/coffee.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final coffeeModel = Provider.of<CoffeeModel>(context);

    return SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(user: user),
                  const SizedBox(height: 20),
                  LoyaltyCard(user: user),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CoffeeList(coffeeModel: coffeeModel),
          ],
        ),
    );
  }
}
