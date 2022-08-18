import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_gridview/routes/app_pages.dart';
import 'package:getx_gridview/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grid View Getx',
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.ITEM,
    );
  }
}
