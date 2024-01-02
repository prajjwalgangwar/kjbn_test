import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class CountdownTimerWidget extends StatefulWidget {
  final CountDownController controller;
  final int duration;
  final Function()? onComplete;
  const CountdownTimerWidget(
      {super.key,
      required this.controller,
      this.duration = 5,
      this.onComplete});

  @override
  CountdownTimerWidgetState createState() => CountdownTimerWidgetState();
}

class CountdownTimerWidgetState extends State<CountdownTimerWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: widget.duration,
      initialDuration: 0,
      controller: widget.controller,
      width: 120,
      height: 120,
      ringColor: Colors.grey.shade400,
      ringGradient: null,
      fillColor: Colors.green.shade600,
      fillGradient: null,
      backgroundColor: Colors.white,
      backgroundGradient: null,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(
          fontSize: 26.0, color: Colors.black, fontWeight: FontWeight.normal),
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: false,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: widget.onComplete,
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "$duration";
        } else {
          return Function.apply(defaultFormatterFunction, [duration.inSeconds]);
        }
      },
    );
  }
}
