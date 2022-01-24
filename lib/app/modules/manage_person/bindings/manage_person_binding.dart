import 'package:get/get.dart';

import '../controllers/manage_person_controller.dart';

class ManagePersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagePersonController>(
      () => ManagePersonController(personService: Get.find()),
    );
  }
}
