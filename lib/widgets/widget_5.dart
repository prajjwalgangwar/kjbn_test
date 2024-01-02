import 'package:flutter/material.dart';
import 'package:kjbn_test_dummy/utils/constants.dart';

class Widget5Button extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const Widget5Button(
      {super.key, this.title = AppConstants.widget5Text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}
