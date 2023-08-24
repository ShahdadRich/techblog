import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_component.dart';
import 'package:tech_blog/strings.dart';

// home scree (qesmate scrool shode)
class profileScreen extends StatelessWidget {
  const profileScreen({
    super.key,
    required this.size,
    required this.textthem,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textthem;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: Assets.images.avatar.provider(),
            height: 120,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.icons.bliepenIcon.provider(),
                color: solidColor.iconPenColor,
              ),
              Text(
                MyStrings.editPorofilePhoto,
                style: textthem.headlineMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'فاطمه امیری',
            style: textthem.bodyLarge,
          ),
          Text(
            'fatemeamiri@gmail.com',
            style: textthem.bodyLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          techBlogDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: solidColor.primryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavBlog,
                  style: textthem.bodyLarge,
                ),
              ),
            ),
          ),
          techBlogDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: solidColor.primryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavPodcast,
                  style: textthem.bodyLarge,
                ),
              ),
            ),
          ),
          techBlogDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: solidColor.primryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.logOut,
                  style: textthem.bodyLarge,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
