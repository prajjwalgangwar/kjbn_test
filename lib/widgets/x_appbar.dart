import 'package:flutter/material.dart';

class XAppBar extends StatelessWidget {
  final String title;
  const XAppBar({super.key, this.title = '( Appbar, add title here )'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(4)),
      child: Center(child: Text(title)),
    );
  }
}
