import 'package:get/get.dart';
import 'package:getx_gridview/routes/app_routes.dart';
import 'package:getx_gridview/view/items/item_bindings.dart';
import 'package:getx_gridview/view/items/item_screen.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.ITEM,
      page: () => const ItemScreen(),
      binding: ItemBinding(),
    ),
  ];
}
