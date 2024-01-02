import 'dart:math';

import 'package:kjbn_test_dummy/models/home_model.dart';
import 'package:kjbn_test_dummy/utils/local_storage.dart';

class XRepository {
  LocalStorage localStorage = LocalStorage();
  int generateRandomNumber() {
    Random random = Random();
    return random.nextInt(60);
  }

  Future<HomeModel?> fetchHomeData() async {
    return await localStorage.getHomeModel();
  }

  Future<bool> saveHomeData(HomeModel model) async {
    return await localStorage.saveHomeModel(model).then((value) => value);
  }
}
