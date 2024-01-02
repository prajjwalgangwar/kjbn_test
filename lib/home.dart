import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/bloc.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/event.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/state.dart';
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
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  return Widget1(
                    title: AppConstants.currentSecond,
                    value: state.currentSecond.toString(),
                    backgroundColor: Colors.blue.shade900,
                  );
                }),
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  return Widget1(
                    title: AppConstants.randomNumber,
                    value: state.randomNumber.toString(),
                    backgroundColor: Colors.pink.shade900,
                  );
                })
              ],
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state.attemptStatus == AttemptStatus.failure) {
                return Widget3(
                  title: state.message,
                  value:
                      '${AppConstants.score}${state.homeModel.failures}/${state.homeModel.attempts}',
                  backgroundColor: Colors.amber.shade500,
                );
              }
              if (state.attemptStatus == AttemptStatus.success) {
                return Widget3(
                  title: state.message,
                  value:
                      '${AppConstants.score}${state.homeModel.successes}/${state.homeModel.attempts}',
                  backgroundColor: Colors.green.shade500,
                );
              }
              return const SizedBox.shrink();
            }),
            CountdownTimerWidget(
              controller: _controller,
              onComplete: () {
                _controller.reset();
                context.read<HomeBloc>().add(NoActionEvent());
              },
            ),
            Widget5Button(
              onTap: () {
                _controller.reset();
                _controller.start();
                context.read<HomeBloc>().add(TapEvent(
                      currentSecond: DateTime.now().second,
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
