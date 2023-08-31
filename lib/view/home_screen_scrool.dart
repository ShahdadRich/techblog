import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/component/colors.dart';

// home scree (qesmate scrool shode)
class homeScreen extends StatelessWidget {
  const homeScreen({
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            // poster
            homePagePoster(size: size, textthem: textthem),
            const SizedBox(
              height: 8,
            ),
            // tag list
            homePageTagList(bodyMargin: bodyMargin, textthem: textthem),
            // titel Papuler Blog
            titelPapularBlog(bodyMargin: bodyMargin, textthem: textthem),
            // list papulerBlog
            listPapularBlog(
                size: size, bodyMargin: bodyMargin, textthem: textthem),
            // titel podcast List
            titelPodcastList(bodyMargin: bodyMargin, textthem: textthem),
            // list podcast
            podcastList(size: size, bodyMargin: bodyMargin, textthem: textthem),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class podcastList extends StatelessWidget {
  const podcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textthem,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: podCastList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(right: index == 0 ? bodyMargin : 15, top: 12),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  child: Container(
                      decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        image: AssetImage(podCastList[index].image),
                        fit: BoxFit.cover),
                  )),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  podCastList[index].titel,
                  style: textthem.displaySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class titelPodcastList extends StatelessWidget {
  const titelPodcastList({
    super.key,
    required this.bodyMargin,
    required this.textthem,
  });

  final double bodyMargin;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, top: 32),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluemiceIcon.provider(),
            color: solidColor.iconMiceColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewPapulerPodCast,
            style: textthem.headlineMedium,
          )
        ],
      ),
    );
  }
}

class listPapularBlog extends StatelessWidget {
  const listPapularBlog({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textthem,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // in jalebe braye moshkhas krdn ye range khasi
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(right: index == 0 ? bodyMargin : 15, top: 12),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover)),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: gradiantColor.papularPosterBg,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textthem.titleMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  blogList[index].views,
                                  style: textthem.titleMedium,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(
                                  CupertinoIcons.eye_fill,
                                  color: Colors.white38,
                                  size: 18,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index].title,
                    style: textthem.displaySmall,
                    // in overflow ro hatmn yadt bashe
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class titelPapularBlog extends StatelessWidget {
  const titelPapularBlog({
    super.key,
    required this.bodyMargin,
    required this.textthem,
  });

  final double bodyMargin;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, top: 32),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bliepenIcon.provider(),
            color: solidColor.iconPenColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewPapulerBlog,
            style: textthem.headlineMedium,
          )
        ],
      ),
    );
  }
}

class homePageTagList extends StatelessWidget {
  const homePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textthem,
  });

  final double bodyMargin;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: tagListBlack(
              textthem: textthem,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    super.key,
    required this.size,
    required this.textthem,
  });

  final Size size;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // axse poster va gradient poster
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(homePagePosterMap['imageAssets']),
                  fit: BoxFit.cover)),
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: gradiantColor.posterGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        // text haye roye poster
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap['writer'] +
                        '  -  ' +
                        homePagePosterMap['uploadDate'],
                    style: textthem.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap['view'],
                        style: textthem.titleMedium,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        CupertinoIcons.eye_fill,
                        color: Colors.white38,
                        size: 18,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'دوازده قدم برنامه نویسی یک دوره ی...س',
                style: textthem.displayLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
