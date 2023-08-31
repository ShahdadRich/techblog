import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/component/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/myCat.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textthem = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techBot.path,
                height: 100,
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.registerIntroTxt,
                    style: textthem.displaySmall),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailBottomSheet(context, size, textthem);
                  },
                  child: const Text(
                    'بزن بریم ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textthem) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.enterEmail,
                    style: textthem.displaySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        print(isEmail(value));
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'techblog@gmail.com',
                        hintStyle: textthem.headlineSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showCodeBottomSheet(context, size, textthem);
                      },
                      child: const Text(
                        'ادامه',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showCodeBottomSheet(
      BuildContext context, Size size, TextTheme textthem) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.enterCode,
                    style: textthem.displaySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        print(isEmail(value));
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '*********',
                        hintStyle: textthem.headlineSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MyCat(),
                        ));
                      },
                      child: const Text(
                        'ادامه',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
