import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/event.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(): super(const HomeState());
}
