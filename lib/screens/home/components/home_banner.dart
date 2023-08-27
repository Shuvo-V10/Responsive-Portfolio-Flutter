import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/responsive.dart';

import '../../../constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 5 / 2 : 3,
      child: Container(
        //padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 200),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            // Container(
            //   //padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(image: AssetImage("assets/images/bg.jpeg"), fit: BoxFit.cover),
            //   ),
            // ),
            Image.asset(
              "assets/images/bg.jpeg",
              fit: BoxFit.cover,
            ),
            Container(color: darkColor.withOpacity(0.66)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Discover my Amazing \nArt Space!",
                    style: Responsive.isDesktop(context)
                        ? Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )
                        : Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                  ),
                  if (Responsive.isMobileLarge(context)) const SizedBox(height: defaultPadding / 2),
                  MyBuildAnimatedText(),
                  SizedBox(height: defaultPadding),
                  if (!Responsive.isMobileLarge(context))
                    ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2, vertical: defaultPadding),
                        backgroundColor: primaryColor,
                      ),
                      child: Text(
                        "EXPLORE NOW",
                        style: TextStyle(color: darkColor),
                      ),
                    ),
                ],
              ),
            ),
            // //Image.network(),
            // Positioned(
            //   left: 50,
            //   top: 300,
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     child: CircleAvatar(
            //       // backgroundImage: NetworkImage("https://pics.jjgirls.com/pictures/kagneylinnkarter/kagney-linn-karter/recommend-milf-xxx-mobile/kagney-linn-karter-3.jpg"),
            //       backgroundImage: AssetImage("assets/images/kagney.jpeg"),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // it applies same style to all the widgets under it
      style: Theme.of(context).textTheme.titleMedium!,
      maxLines: 1,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context)) FlutterCodedText(),
          if (!Responsive.isMobileLarge(context)) SizedBox(width: defaultPadding / 2),
          Text("I build "),
          Responsive.isMobile(context) ? Expanded(child: AnimatedText()) : AnimatedText(),
          //AnimatedText(),
          if (!Responsive.isMobileLarge(context)) SizedBox(width: defaultPadding / 2),
          if (!Responsive.isMobileLarge(context)) FlutterCodedText(),
        ],
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          "responsive web and mobile app.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "complete e-Commerce app UI.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "Chat app with dark and light theme.",
          speed: Duration(milliseconds: 60),
        ),
      ],
    );
  }
}

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: "flutter",
            style: TextStyle(color: primaryColor),
          ),
          TextSpan(text: ">"),
        ],
      ),
    );
  }
}
