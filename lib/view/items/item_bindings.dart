import 'package:get/get.dart';
import 'package:getx_gridview/controller/item_controller.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ItemController(), permanent: true);
  }
}
