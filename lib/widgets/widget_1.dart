import 'package:flutter/material.dart';
import 'package:kjbn_test_dummy/widgets/x_divider.dart';

class Widget1 extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  const Widget1(
      {super.key,
      required this.title,
      required this.value,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: backgroundColor)),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const XDivider(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(value),
        )
      ]),
    );
  }
}
