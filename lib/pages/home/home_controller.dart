import 'package:get/get.dart';
import 'package:kooking/pages/home/widgets/select_dialog.dart';

import '../../db/db_service.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();
  final db = Get.find<DatabaseService>();
  var durationTotal = "0".obs;
  var consumptionTotal = "0".obs;

  List<Map<String, String>> projects = [
    {"name": "bowling", "image": "assets/images/image_bowling.png", "price": "0"},
    {"name": "basketball", "image": "assets/images/image_basketball.png", "price": "0"},
    {"name": "football", "image": "assets/images/image_football.png", "price": "0"},
    {"name": "baseball", "image": "assets/images/image_baseball.png", "price": "0"},
    {"name": "billiards", "image": "assets/images/image_billiards.png", "price": "0"},
    {"name": "tennis", "image": "assets/images/image_tennis.png", "price": "0"},
    {"name": "badminton", "image": "assets/images/image_badminton.png", "price": "0"},
    {"name": "golf", "image": "assets/images/image_golf.png", "price": "0"}
  ];

  select(String projectName) {
    Get.dialog(SelectDialog(
      selectAction: (int value) {
        Get.back();
        Get.toNamed('/add', arguments: {
          "projectName": projectName,
          "type": value,
          "title": value == 1 ? "Record Workout" : "Record Spending"
        });
      },
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    intDate();
    super.onInit();
  }

  intDate() {
    totalDuration();
    totalConsumption();
    totalAllProject();
  }

  totalDuration() async {
    var value = await db.calculateSum("exercise_duration");
    durationTotal.value = value.toStringAsFixed(1);
  }

  totalConsumption() async {
    var value = await db.calculateSum("exercise_price");
    consumptionTotal.value = value.toStringAsFixed(1);
  }

  totalAllProject() async {
    await Future.wait(projects.map((e) async {
      var value = await db.projectPriceSum(e["name"]!);
      e["price"] = "$value";
    }));
    update(["gridView"]);
  }

  clear() {
    durationTotal.value = "0";
    consumptionTotal.value = "0";
    projects = [
      {"name": "bowling", "image": "assets/images/image_bowling.png", "price": "0"},
      {"name": "basketball", "image": "assets/images/image_basketball.png", "price": "0"},
      {"name": "football", "image": "assets/images/image_football.png", "price": "0"},
      {"name": "baseball", "image": "assets/images/image_baseball.png", "price": "0"},
      {"name": "billiards", "image": "assets/images/image_billiards.png", "price": "0"},
      {"name": "tennis", "image": "assets/images/image_tennis.png", "price": "0"},
      {"name": "badminton", "image": "assets/images/image_badminton.png", "price": "0"},
      {"name": "golf", "image": "assets/images/image_golf.png", "price": "0"}
    ];
    update();
  }
}
