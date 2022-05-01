import 'package:flutter/material.dart';
import 'package:uas_pemrograman_android/common/common.dart';
import 'package:uas_pemrograman_android/component/border_box.dart';

class foodDetail extends StatelessWidget {
  final dynamic itemData;

  const foodDetail({Key key, @required this.itemData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          itemData["image"],
                          width: size.width,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          width: size.width,
                          top: padding,
                          child: Padding(
                            padding: sidePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: BorderBox(
                                    height: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.keyboard_backspace,
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                                BorderBox(
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${itemData["name"]}",
                                style: themeData.textTheme.headline1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${formatCurrency(itemData["amount"])}",
                                    style: themeData.textTheme.headline1,
                                  ),
                                  addHSpace(20),
                                  BorderBox(
                                    child: Text(
                                      "${itemData["update"]}",
                                      style: themeData.textTheme.headline5,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    addVSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "Informasi Makanan",
                        style: themeData.textTheme.headline4,
                      ),
                    ),
                    addVSpace(padding),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          InformationTile(
                            content: "${itemData["fat"]}",
                            name: "Lemak",
                          ),
                          InformationTile(
                            content: "${itemData["protein"]}",
                            name: "Protein",
                          ),
                          InformationTile(
                            content: "${itemData["carbohydrate"]}",
                            name: "Kabohidrat",
                          ),
                          InformationTile(
                            content: "${itemData["sodium"]}",
                            name: "Natrium",
                          )
                        ],
                      ),
                    ),
                    addVSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        itemData["description"],
                        textAlign: TextAlign.justify,
                        style: themeData.textTheme.bodyText2,
                      ),
                    ),
                    addVSpace(100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget {
  final String content;
  final String name;

  const InformationTile({Key key, @required this.content, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width * 0.20;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderBox(
              width: tileSize,
              height: tileSize,
              child: Text(
                content,
                style: themeData.textTheme.headline3,
              )),
          addVSpace(15),
          Text(
            name,
            style: themeData.textTheme.headline6,
          )
        ],
      ),
    );
  }
}
