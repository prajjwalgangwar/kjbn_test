import 'dart:math';

class XRepository {
  static int generateRandomNumber() {
    Random random = Random();
    return random.nextInt(60);
  }
}
