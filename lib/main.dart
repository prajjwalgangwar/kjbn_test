import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/bloc.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/event.dart';
import 'package:kjbn_test_dummy/repository.dart';
import 'package:kjbn_test_dummy/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) =>
                HomeBloc(repository: XRepository())..add(InitialHomeEvent())))
      ],
      child: MaterialApp(
        title: 'KJBN Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
