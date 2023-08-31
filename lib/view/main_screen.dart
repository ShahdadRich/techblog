import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/view/home_screen_scrool.dart';
import 'package:tech_blog/view/porofile_screen.dart';
import '../gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selctedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var textthem = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: solidColor.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.logo.path,
                      scale: 2,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'پروفایل کاربری',
                    style: textthem.bodyLarge,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: solidColor.dividerColor,
                ),
                ListTile(
                  title: Text(
                    'درباره تک‌بلاگ',
                    style: textthem.bodyLarge,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: solidColor.dividerColor,
                ),
                ListTile(
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: textthem.bodyLarge,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: solidColor.dividerColor,
                ),
                ListTile(
                  title: Text(
                    'تک‌بلاگ در گیت هاب',
                    style: textthem.bodyLarge,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: solidColor.dividerColor,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: solidColor.scafoldBg,
          scrolledUnderElevation: 0,
          title:
              // app bar
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: ImageIcon(Assets.icons.hambegrMenuIcon.provider())),
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              ImageIcon(Assets.icons.serchIcon.provider()),
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Positioned.fill(
                child: IndexedStack(
                  index: selctedIndex,
                  children: [
                    homeScreen(
                        size: size, textthem: textthem, bodyMargin: bodyMargin),
                    profileScreen(
                        size: size, textthem: textthem, bodyMargin: bodyMargin),
                  ],
                ),
              ),
            ),

            // bottem nav
            bottemNav(
                size: size,
                bodyMargin: bodyMargin,
                screenChanger: (int value) {
                  setState(() {
                    selctedIndex = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class bottemNav extends StatelessWidget {
  const bottemNav({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.screenChanger,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) screenChanger;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: gradiantColor.bootmNavBg,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(
            right: bodyMargin,
            left: bodyMargin,
          ),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                gradient: LinearGradient(colors: gradiantColor.bootmNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => screenChanger(0),
                  icon: ImageIcon(
                    Assets.icons.homeIcon.provider(),
                    color: solidColor.navbarIconColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    Assets.icons.riwtterIcon.provider(),
                    color: solidColor.navbarIconColor,
                  ),
                ),
                IconButton(
                  onPressed: () => screenChanger(1),
                  icon: ImageIcon(
                    Assets.icons.profileIcon.provider(),
                    color: solidColor.navbarIconColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
