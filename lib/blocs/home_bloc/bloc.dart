import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/event.dart';
import 'package:kjbn_test_dummy/blocs/home_bloc/state.dart';
import 'package:kjbn_test_dummy/home_model.dart';
import 'package:kjbn_test_dummy/repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final XRepository repository;
  HomeBloc({required this.repository}) : super(const HomeState()) {
    on<TapEvent>(buttonTap);
    on<InitialHomeEvent>(initialEvent);
    on<NoActionEvent>(noAction);
  }

  initialEvent(InitialHomeEvent event, Emitter<HomeState> emit) async {
    HomeModel? model = await repository.fetchHomeData();
    if (model != null) {
      emit(state.copyWith(
          homeModel: model, attemptStatus: AttemptStatus.success));
    }
  }

  buttonTap(TapEvent event, Emitter<HomeState> emit) async {
    AttemptStatus attemptStatus = AttemptStatus.initial;
    int random = repository.generateRandomNumber();
    int currentSecond = event.currentSecond;

    HomeModel model = state.homeModel;
    int successCount = state.homeModel.successes;
    int failCount = state.homeModel.failures;
    if (random == currentSecond) {
      successCount++;
      attemptStatus = AttemptStatus.success;
    } else {
      failCount++;
      attemptStatus = AttemptStatus.failure;
    }
    HomeModel updatedModel = state.homeModel.copyWith(
        attempts: model.attempts + 1,
        failures: failCount,
        successes: successCount);
    debugPrint('updatedModel: $updatedModel');
    await repository.saveHomeData(updatedModel).then((value) {
      if (value) {
        emit(state.copyWith(
            currentSecond: currentSecond,
            randomNumber: random,
            attemptStatus: attemptStatus,
            homeModel: updatedModel));
      }
    });
  }

  noAction(NoActionEvent event, Emitter<HomeState> emit) async {
    HomeModel model = state.homeModel;

    HomeModel updatedModel = state.homeModel.copyWith(
      attempts: model.attempts + 1,
      failures: model.failures + 1,
    );
    await repository.saveHomeData(updatedModel).then((value) {
      if (value) {
        emit(state.copyWith(
            attemptStatus: AttemptStatus.failure, homeModel: updatedModel));
      }
    });
  }
}
