import 'package:get/get.dart';
import 'package:getx_gridview/services/remote_service.dart';

import '../models/item_model.dart';

class ItemController extends GetxController {
  var isLoading = true.obs;
  var isAddLoading = false.obs;
  var itemList = List<Item>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchItem(0);
    super.onInit();
  }

  Future<void> fetchItem(int start) async {
    try {
      isLoading(true);
      itemList.clear();
      var response = await RemoteServices.fetchItem(start);
      if (response.statusCode == 200) {
        List<Item> items = itemFromJson(response.body);
        itemList.assignAll(items);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> addItem(int start) async {
    try {
      isAddLoading(true);
      var response = await RemoteServices.fetchItem(start);
      if (response.statusCode == 200) {
        List<Item> items = itemFromJson(response.body);
        itemList.assignAll(items);
      }
    } finally {
      isAddLoading(false);
    }
  }
}
