import 'package:flutter/material.dart';
import 'package:kjbn_test_dummy/widgets/x_divider.dart';

class Widget3 extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  const Widget3(
      {super.key,
      required this.title,
      required this.value,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: backgroundColor)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white),
              ),
            ),
            const XDivider(
              verticalMargin: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white)),
            )
          ]),
    );
  }
}
