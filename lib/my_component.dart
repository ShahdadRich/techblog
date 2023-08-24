import 'package:flutter/material.dart';
import 'colors.dart';
import 'gen/assets.gen.dart';
import 'model/fake_data.dart';

// ignore: camel_case_types
class techBlogDivider extends StatelessWidget {
  const techBlogDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: solidColor.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class tagListBlack extends StatelessWidget {
  tagListBlack({
    super.key,
    required this.textthem,
    required this.index,
  });

  final TextTheme textthem;
  // ignore: prefer_typing_uninitialized_variables
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
              colors: gradiantColor.tagBg,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtagIcon.provider(),
              color: Colors.white60,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: textthem.displayMedium,
            )
          ],
        ),
      ),
    );
  }
}
