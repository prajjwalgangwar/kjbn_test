import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:kjbn_test_dummy/constants.dart';
import 'package:kjbn_test_dummy/widgets/widget_1.dart';
import 'package:kjbn_test_dummy/widgets/widget_3.dart';
import 'package:kjbn_test_dummy/widgets/widget_4.dart';
import 'package:kjbn_test_dummy/widgets/widget_5.dart';
import 'package:kjbn_test_dummy/widgets/x_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CountDownController _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: const XAppBar()),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Widget1(
                  title: AppConstants.currentSecond,
                  value: '37',
                  backgroundColor: Colors.blue.shade900,
                ),
                Widget1(
                  title: AppConstants.randomNumber,
                  value: '39',
                  backgroundColor: Colors.pink.shade900,
                )
              ],
            ),
            Widget3(
              title: AppConstants.sorryTryAgain,
              value: '${AppConstants.attempt}1',
              backgroundColor: Colors.amber.shade500,
            ),
            CountdownTimerWidget(
              controller: _controller,
            ),
            Widget5Button(
              onTap: () {
                if (_controller.isStarted) {
                  _controller.reset();
                  setState(() {});
                } else {
                  _controller.start();
                  setState(() {});
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
