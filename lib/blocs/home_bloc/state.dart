import 'package:equatable/equatable.dart';
import 'package:kjbn_test_dummy/home_model.dart';

enum AttemptStatus { initial, failure, success }

class HomeState extends Equatable {
  final int randomNumber;
  final int currentSecond;

  final HomeModel homeModel;
  final AttemptStatus attemptStatus;

  const HomeState({
    this.randomNumber = 0,
    this.currentSecond = 0,
    this.homeModel = const HomeModel(),
    this.attemptStatus = AttemptStatus.initial,
  });

  HomeState copyWith({
    int? randomNumber,
    int? currentSecond,
    HomeModel? homeModel,
    AttemptStatus? attemptStatus,
  }) {
    return HomeState(
        currentSecond: currentSecond ?? this.currentSecond,
        homeModel: homeModel ?? this.homeModel,
        attemptStatus: attemptStatus ?? this.attemptStatus,
        randomNumber: randomNumber ?? this.randomNumber);
  }

  @override
  List<Object?> get props =>
      [currentSecond, randomNumber, homeModel, attemptStatus];
}
