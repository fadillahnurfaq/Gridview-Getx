import 'package:flutter/material.dart';
import 'package:getx_gridview/utils/size_config.dart';
import 'package:getx_gridview/view/items/components/item_gridview.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: ItemGridView(),
    );
  }
}
