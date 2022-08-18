import 'package:flutter/material.dart';
import 'package:getx_gridview/models/item_model.dart';
import 'package:getx_gridview/utils/constant.dart';
import 'package:getx_gridview/utils/size_config.dart';

class ItemFound extends StatelessWidget {
  final Item item;
  const ItemFound(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(
          screenWidth(20),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 10.0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Hero(
                  tag: "tagHero${item.id}",
                  child: Image.network(
                    item.image.toString(),
                    fit: BoxFit.scaleDown,
                    height: screenHeight(150),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight(10),
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                      fontSize: screenWidth(16),
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: screenHeight(10),
                  ),
                  Container(
                    child: item.tags != null
                        ? Text(
                            "LKR ${item.tags!.first.price.toString()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: kPrimaryColor,
                            ),
                          )
                        : Container(),
                  ),
                  SizedBox(
                    height: screenHeight(10),
                  ),
                  Text(
                    "${item.tags!.first.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
