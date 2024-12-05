import 'package:flutter/material.dart';
import 'package:midterm_flutter/component/redeem_card.dart';
import 'package:midterm_flutter/screen/detail.dart';
import 'package:provider/provider.dart';
import '../component/custom_app_bar.dart';
import '../model/redeemable.dart';
import '../model/user.dart';

class Redeem extends StatelessWidget {
  const Redeem({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final redeemable = Provider.of<RedeemableModel>(context);
    return Scaffold(
        appBar: const CustomAppBar(title: "Redeem", disableCartButton: true),
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 40),
              itemCount: redeemable.items.length,
              itemBuilder: (context, index) {
                final redeem = redeemable.items[index];

                if (redeem.used) {
                  return Container();
                }

                final coffee = redeem.toCoffee();
                return RedeemCard(
                  redeem: redeem,
                  userPoint: user.points,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(
                                coffee: coffee,
                                checkoutCallback: () {
                                  if (user.points >= redeem.point) {
                                    redeemable.useRedeem(index);
                                    user.redeemPoint(redeem.point);
                                  }
                                },
                              )),
                    );
                  },
                );
              },
            )));
  }
}
