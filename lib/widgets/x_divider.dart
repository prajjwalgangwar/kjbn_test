import 'package:flutter/material.dart';

class XDivider extends StatelessWidget {
  final double horizontalMargin;
  final double verticalMargin;
  final Color color;
  const XDivider(
      {super.key,
      this.horizontalMargin = 0,
      this.verticalMargin = 8,
      this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin, vertical: verticalMargin),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: color),
    );
  }
}
