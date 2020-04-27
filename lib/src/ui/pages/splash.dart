import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onlinequeue/src/resources/strings.dart';
import 'package:onlinequeue/src/ui/pages/home.dart';
import 'package:onlinequeue/src/ui/pages/home_page.dart';
import 'package:onlinequeue/src/ui/pages/login_page.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onDoneLoading("Authenticate");
  }

  onDoneLoading(String widgetToOpen) async {
    if (widgetToOpen == "Home") {
      await Future.delayed(Duration(seconds: 5));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
    if (widgetToOpen == "Authenticate") {
      await Future.delayed(Duration(seconds: 5));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 96.0 / 100
                  : MediaQuery.of(context).size.height * 1.5,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * 5 / 100
                    : MediaQuery.of(context).size.width * 5 / 100,
                bottom: MediaQuery.of(context).size.height * 10 / 100,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xff01b6ad).withOpacity(0.5),
                    Color(0xff095365).withOpacity(0.5)
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    '${Strings().logoImg}',
                    width: MediaQuery.of(context).orientation ==
                        Orientation.portrait
                        ? MediaQuery.of(context).size.width * 70 / 100
                        : MediaQuery.of(context).size.width * 30 / 100,
                    height: MediaQuery.of(context).orientation ==
                        Orientation.portrait
                        ? MediaQuery.of(context).size.width * 60 / 100
                        : MediaQuery.of(context).size.width * 30 / 100,
                  ),
                  Image.asset(
                    '${Strings().loadingImg}',
                    width: MediaQuery.of(context).size.width * 10 / 100,
                    height: MediaQuery.of(context).size.width * 20.0 / 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${Strings().appName}',
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontFamily: 'Kufi',
                            fontSize: 45.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${Strings().splashText01}',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontFamily: 'Kufi',
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
