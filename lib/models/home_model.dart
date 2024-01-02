class HomeModel {
  final int attempts;
  final int failures;
  final int successes;

  const HomeModel({
    this.attempts = 0,
    this.failures = 0,
    this.successes = 0,
  });

  // Convert the object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'attempts': attempts,
      'failures': failures,
      'successes': successes,
    };
  }

  // Create an object from JSON data
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      attempts: json['attempts'] ?? 0,
      failures: json['failures'] ?? 0,
      successes: json['successes'] ?? 0,
    );
  }

  // Convert the object to a string representation
  @override
  String toString() {
    return 'HomeModel{attempts: $attempts, failures: $failures, successes: $successes}';
  }

  // Create a copy of the object with optional changes
  HomeModel copyWith({
    int? attempts,
    int? failures,
    int? successes,
  }) {
    return HomeModel(
      attempts: attempts ?? this.attempts,
      failures: failures ?? this.failures,
      successes: successes ?? this.successes,
    );
  }
}
