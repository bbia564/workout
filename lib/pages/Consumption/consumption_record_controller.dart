import 'package:get/get.dart';

import '../../db/db_service.dart';
import '../../entity/exercise_bean.dart';

class ConsumptionRecordController extends GetxController {
  final recordList = <ExerciseBean>[].obs;
  final db = Get.find<DatabaseService>();

  @override
  onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    recordList.value = await db.getAllConsumption();
  }
}
