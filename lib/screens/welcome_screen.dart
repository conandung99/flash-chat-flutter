import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/button_padding.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      // upperBound: 100.0, // Set the upper value, default [0.0 , 1.0];
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();
    // controller.reverse(from: 1.0);
    controller.addListener(() {
      setState(() {});
      // print(controller.value);
      print(animation.value);
    });

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: animation.value,
      // backgroundColor: Colors.white
      //     .withOpacity(controller.value), // Notice the when the value > 1.0
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0 /*controller.value*/,
                      // height: animation.value * 100,
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 300),
                  text: ['Flash Chat'],
                  // '${controller.value.toInt()}%',
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonPadding(
              color: Colors.blueAccent,
              text: 'Login',
              function: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            ButtonPadding(
              color: Colors.blueAccent,
              function: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
