import 'package:get/get.dart';

import '../../db/db_service.dart';
import '../../entity/exercise_bean.dart';

class RecordController extends GetxController {
  final recordList = <ExerciseBean>[].obs;
  final db = Get.find<DatabaseService>();
  static RecordController get to => Get.find<RecordController>();
  @override
  onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    recordList.value = await db.getAll();
  }
}
