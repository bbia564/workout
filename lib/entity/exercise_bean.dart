import 'package:intl/intl.dart';

class ExerciseBean {
  int id;
  String name;
  double? price;
  double ?duration;
  String? log;
  String createdAt;

  ExerciseBean(
    this.id,
    this.name,
    this.price,
    this.duration,
    this.log,
    this.createdAt,
  );

  factory ExerciseBean.fromJson(Map<String, dynamic> json) {
    return ExerciseBean(
      json['id'],
      json['name'],
      json['exercise_price'],
      json['exercise_duration'],
      json['exercise_log'],
      json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name,
      "exercise_price": price,
      "exercise_duration": duration,
      "exercise_log": log,
      "created_at": createdAt,
    };
  }

}
