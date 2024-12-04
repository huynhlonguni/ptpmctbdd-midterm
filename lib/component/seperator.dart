import 'package:flutter/material.dart';

class Seperator extends StatelessWidget {
  final double gapSize;
  const Seperator({
    super.key,
    this.gapSize = 16
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: gapSize),
        SizedBox(
          height: 1,
          width: double.infinity,
          child: Container(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        SizedBox(height: gapSize),
      ],
    );
  }
}
