import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_gridview/view/items/components/item_found_card.dart';

import '../../../controller/item_controller.dart';

import 'item_loading_card.dart';

class ItemGridView extends StatefulWidget {
  const ItemGridView({Key? key}) : super(key: key);

  @override
  _ItemGridViewState createState() => _ItemGridViewState();
}

class _ItemGridViewState extends State<ItemGridView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          Get.find<ItemController>().itemList.length % 10 == 0) {
        Get.find<ItemController>()
            .addItem(Get.find<ItemController>().itemList.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<ItemController>().isLoading.value) {
        return GridView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.6),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: index % 2 == 0 ? 10 : 10,
                      right: index % 2 == 0 ? 5 : 20,
                      left: index % 2 == 1 ? 5 : 20,
                      bottom: index % 2 == 1 ? 10 : 10),
                  child: const ItemLoadingCard());
            });
      } else {
        return RefreshIndicator(
          onRefresh: () async {
            Get.find<ItemController>().fetchItem(0);
          },
          child: GridView.builder(
              shrinkWrap: true,
              controller: scrollController,
              itemCount: Get.find<ItemController>().isAddLoading.value
                  ? Get.find<ItemController>().itemList.length + 10
                  : Get.find<ItemController>().itemList.length + 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.6),
              itemBuilder: (BuildContext context, int index) {
                if (Get.find<ItemController>().itemList.length <= index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: index % 2 == 0 ? 10 : 10,
                        right: index % 2 == 0 ? 5 : 20,
                        left: index % 2 == 1 ? 5 : 20,
                        bottom: index % 2 == 1 ? 10 : 10),
                    child: const ItemLoadingCard(),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(
                      top: index % 2 == 0 ? 10 : 10,
                      right: index % 2 == 0 ? 5 : 20,
                      left: index % 2 == 1 ? 5 : 20,
                      bottom: index % 2 == 1 ? 10 : 10),
                  child: ItemFound(
                    Get.find<ItemController>().itemList[index],
                  ),
                );
              }),
        );
      }
    });
  }
}
