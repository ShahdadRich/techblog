import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/component/colors.dart';

class MyCat extends StatefulWidget {
  @override
  State<MyCat> createState() => _MyCatState();
}

class _MyCatState extends State<MyCat> {
  @override
  Widget build(BuildContext context) {
    var textthem = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.techBot.path,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    MyStrings.loginSavesucssesFull,
                    style: textthem.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'نام و نام خانوادگی',
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyStrings.choseFavCats,
                    style: textthem.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  // tag list
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 95,
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedTagList
                                      .contains(tagList[index])) {
                                    selectedTagList.remove(index);
                                  } else {
                                    selectedTagList.add(tagList[index]);
                                  }
                                });
                              },
                              child: tagListBlack(
                                  textthem: textthem, index: index));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Image.asset(
                    Assets.icons.arrow.path,
                    color: solidColor.primryColor,
                    scale: 3,
                  ),
                  // add fav cats
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 95,
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: selectedTagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: solidColor.surFaceColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    selectedTagList[index].title,
                                    style: textthem.displaySmall,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTagList.removeAt(index);
                                      });
                                    },
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: solidColor.dividerColor,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
