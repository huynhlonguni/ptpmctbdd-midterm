import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/redeemable.dart';

class RedeemCard extends StatelessWidget {
  const RedeemCard(
      {super.key,
      required this.redeem,
      required this.onPressed,
      required this.userPoint});
  final Redeemable redeem;
  final VoidCallback onPressed;
  final int userPoint;

  @override
  Widget build(BuildContext context) {
    final String time = DateFormat('dd.MM.yy').format(redeem.endTime);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
                tag: redeem.image,
                child: Image.asset(redeem.image, height: 60)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(redeem.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize:
                          Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: FontWeight.w600,
                    )),
                Text('Valid until $time',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surfaceDim,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: userPoint >= redeem.point
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              borderRadius: BorderRadius.circular(100)),
          child: TextButton(
            style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            onPressed: onPressed,
            child: Text(
              '${redeem.point} pts',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}
