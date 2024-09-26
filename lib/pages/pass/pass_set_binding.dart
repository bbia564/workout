import 'package:get/get.dart';

import 'pass_set_logic.dart';

class PassSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
