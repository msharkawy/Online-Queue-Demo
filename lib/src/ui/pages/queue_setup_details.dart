
import 'package:flutter/material.dart';
import 'package:onlinequeue/main.dart';
import 'package:onlinequeue/src/helpers/courseModel.dart';
import 'package:onlinequeue/src/theme/theme.dart';
import 'package:onlinequeue/src/ui/pages/home_page.dart';
import 'package:onlinequeue/src/theme/color/light_color.dart';
import 'package:onlinequeue/src/helpers/quad_clipper.dart';
import 'package:onlinequeue/src/theme/color/light_color.dart';

class QueueSetupDetails extends StatelessWidget {
  QueueSetupDetails({Key key}) : super(key: key);

  double width;

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 120,
          width: width,
          decoration: BoxDecoration(
            color: LightColor.orange,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 10,
                  right: -120,
                  child: _circularContainer(
                      300, LightColor.lightOrange2.withOpacity(0.5))),
              Positioned(
                  top: -60,
                  left: -65,
                  child: _circularContainer(
                      width * .5, LightColor.darkOrange.withOpacity(0.2))),
              Positioned(
                  top: -230,
                  right: -30,
                  child: _circularContainer(width * .7, Colors.transparent,
                      borderColor: Colors.white38)),
              Positioned(
                  top: 50,
                  left: 0,
                  child: Container(
                      width: width,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Queue Setup # 01",
                                style: TextStyle(
                                    color: Color(0xff095365),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ))),
            ],
          )),
    );
  }

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget _categoryRow(String title) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      height: 68,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                  color: LightColor.extraDarkPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: width,
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 20),
                  _chip("Data Scientist", LightColor.yellow, height: 5),
                  SizedBox(width: 10),
                  _chip("Data Analyst", LightColor.seeBlue, height: 5),
                  SizedBox(width: 10),
                  _chip("Data Engineer", LightColor.orange, height: 5),
                  SizedBox(width: 10),
                  _chip("Data Scientist", LightColor.lightBlue, height: 5),
                ],
              )),
          SizedBox(height: 10)
        ],
      ),
    );
  }

  Widget _courseList() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _courceInfo(CourseList.list[0],
                _decorationContainerA(Colors.redAccent, -110, -85),
                background: LightColor.seeBlue),
          ],
        ),
      ),
    );
  }

  Widget _card(
      {Color primaryColor = Colors.redAccent,
      String imgPath,
      Widget backWidget}) {
    return Container(
        height: 190,
        width: width * .34,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: Color(0x12000000))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: backWidget,
        ));
  }

  Widget _courceInfo(CourseModel model, Widget decoration, {Color background}) {
    return Container(
        width: width - 20,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'Category : ',
                                style: TextStyle(
                                    color: LightColor.darkOrange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            new TextSpan(
                                text: 'Category # 01',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      )),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'Queue Length : ',
                                style: TextStyle(
                                    color: LightColor.darkOrange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            new TextSpan(
                                text: '8 Hours',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'Service Provider : ',
                                style: TextStyle(
                                    color: LightColor.darkOrange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            new TextSpan(
                                text: 'Banda',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      )),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'Branch : ',
                                style: TextStyle(
                                    color: LightColor.darkOrange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            new TextSpan(
                                text: 'Al Murabaa',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'Start Time : ',
                                style: TextStyle(
                                    color: LightColor.darkOrange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            new TextSpan(
                                text: '09 : 00 AM',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      )),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'End Time : ',
                                style: TextStyle(
                                    color: LightColor.darkOrange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            new TextSpan(
                                text: '05 : 00 PM',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: background,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 8,
                      child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'Notes : ',
                                style: TextStyle(
                                    color: LightColor.darkOrange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            new TextSpan(
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
               SizedBox(height: 15),

//                Center(
//                  child: Container(
//                    width: 70.0,
//                   height: 70.0,
//                   decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(50.0),
//                        gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                            end: Alignment.bottomRight,
//                            colors: [
//                              LightColor.darkOrange,
//                              LightColor.lightpurple,
//                            ])),
//                    alignment: Alignment.center,
//                    child: MaterialButton(
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(50.0)),
//                      child: Icon(
//                        Icons.arrow_back_ios,
//                        color: Colors.white,
//                        size: 30,
//                      ),
//                      onPressed: (){
//                        Navigator.pushReplacement(context, MaterialPageRoute(
//                            builder: (context) => HomePage()
//                        ));
//                      },
//                    ),
//                  ),
//                )
//
              ],
            ))
          ],
        ));
  }

  Widget _chip(String text, Color textColor,
      {double height = 0, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
      ),
    );
  }

  Widget _decorationContainerA(Color primaryColor, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: LightColor.darkseeBlue,
          ),
        ),
        _smallContainer(LightColor.yellow, 40, 20),
        Positioned(
          top: -30,
          right: -10,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        ),
        Positioned(
          top: 110,
          right: -50,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: LightColor.darkseeBlue,
            child:
                CircleAvatar(radius: 40, backgroundColor: LightColor.seeBlue),
          ),
        ),
      ],
    );
  }

  Widget _decorationContainerB() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -65,
          left: -65,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: LightColor.lightOrange2,
            child: CircleAvatar(
                radius: 30, backgroundColor: LightColor.darkOrange),
          ),
        ),
        Positioned(
            bottom: -35,
            right: -40,
            child:
                CircleAvatar(backgroundColor: LightColor.yellow, radius: 40)),
        Positioned(
          top: 50,
          left: -40,
          child: _circularContainer(70, Colors.transparent,
              borderColor: Colors.white),
        ),
      ],
    );
  }

  Widget _decorationContainerC() {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: -65,
          left: -35,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Color(0xfffeeaea),
          ),
        ),
        Positioned(
            bottom: -30,
            right: -25,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: LightColor.yellow, radius: 40))),
        _smallContainer(
          Colors.yellow,
          35,
          70,
        ),
      ],
    );
  }

  Positioned _smallContainer(Color primaryColor, double top, double left,
      {double radius = 10}) {
    return Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primaryColor.withAlpha(255),
        ));
  }

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(
        //  backgroundColor: Colors.blue,
        icon: Icon(icon),
        title: Text(""));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              width: width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xff298cb6),
                    Color(0xff095365).withOpacity(0.3)
                  ],
                ),
              ),
      child: Column(
        children: <Widget>[
          _header(context),
          SizedBox(height: 20),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _courceInfo(CourseList.list[2], _decorationContainerC(),
                    background: LightColor.lightOrange2),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
