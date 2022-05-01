import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uas_pemrograman_android/common/common.dart';
import 'package:uas_pemrograman_android/component/border_box.dart';
import 'package:uas_pemrograman_android/content/food_detail.dart';
import 'package:uas_pemrograman_android/sample_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* Container Size
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final ThemeData themeData = Theme.of(context);
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BorderBox(
                      child: Icon(
                        Icons.menu,
                        color: blackColor,
                      ),
                      height: 50,
                      width: 50,
                    ),
                    const BorderBox(
                      child: Icon(
                        Icons.settings,
                        color: blackColor,
                      ),
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
              addVSpace(padding),
              Padding(
                padding: sidePadding,
                child: Text(
                  "Kantin SMA Adadeh",
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                padding: sidePadding,
                child: Divider(
                  height: padding,
                  color: greyColor,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ["Makanan", "Minuman", "Buah-Buahan"]
                      .map((filter) => ChoiceOption(
                            text: filter,
                          ))
                      .toList(),
                ),
              ),
              addVSpace(10),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                    itemCount: apiData.length,
                    itemBuilder: (context, index) {
                      return FoodItem(itemData: apiData[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: greyColor.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 13,
      ),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final dynamic itemData;

  const FoodItem({Key key, @required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => foodDetail(
              itemData: itemData,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    itemData["image"],
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                    child: Icon(
                      Icons.favorite_border,
                      color: blackColor,
                    ),
                    height: 50,
                  ),
                ),
              ],
            ),
            addVSpace(15),
            Row(
              children: [
                Text(
                  "${itemData["name"]}",
                  style: themeData.textTheme.headline2,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${formatCurrency(itemData["amount"])}",
                  style: themeData.textTheme.headline4,
                ),
                addHSpace(10),
                Text(
                  "${itemData["update"]}",
                  style: themeData.textTheme.bodyText2,
                ),
              ],
            ),
            addVSpace(10),
            Text(
              "${itemData["category"]}",
              style: themeData.textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
