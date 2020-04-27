import 'package:flutter/material.dart';
import 'package:onlinequeue/src/helpers/quad_clipper.dart';
import 'package:onlinequeue/src/resources/strings.dart';
import 'package:onlinequeue/src/ui/pages/home.dart';
import 'package:onlinequeue/src/ui/pages/new_request.dart';
import 'package:onlinequeue/src/ui/pages/queue_setup_details.dart';
import 'package:onlinequeue/src/ui/pages/recomended_page.dart';
import 'package:onlinequeue/src/theme/color/light_color.dart';
import 'package:onlinequeue/src/ui/widgets/shared.dart';
import 'package:overlay_support/overlay_support.dart';

class UserHomePage extends StatefulWidget {
  final String userId;
  UserHomePage({this.userId});
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List list = ['1', '2', '1', '2', '1', '2', '1', '2', '1', '2', '1', '2'];
  double width;
  double screenWidth, screenheigh;

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    screenWidth = width;
    screenheigh = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 150,
          width: width,
          decoration: BoxDecoration(
            color: LightColor.purple,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 30,
                  right: -100,
                  child: _circularContainer(300, LightColor.lightpurple)),
              Positioned(
                  top: -100,
                  left: -45,
                  child: _circularContainer(width * .5, LightColor.darkpurple)),
              Positioned(
                  top: -180,
                  right: -30,
                  child: _circularContainer(width * .7, Colors.transparent,
                      borderColor: Colors.white38)),
              Positioned(
                  top: 40,
                  left: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Search Requests",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: 'WorkSansSemiBold',
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type Something...",
                                hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      )))
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

  Widget _categoryRow(
      String title,
      Color primary,
      Color textColor,
      ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: LightColor.titleTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: 'Monister'),
          ),
          _chip("See all", LightColor.darkOrange)
        ],
      ),
    );
  }

  Widget _featuredRowA() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              child: _card(
                  primary: LightColor.orange,
                  backWidget:
                  _decorationContainerA(LightColor.lightOrange, 50, -30),
                  chipColor: LightColor.orange,
                  chipText1: "From 9:00 AM to 5:00 PM",
                  chipText2: "8 Hours",
                  isPrimaryCard: true,
                  queueStatus: '0'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => QueueSetupDetails()
                )
                );
              },
            ),
            _card(
                primary: Colors.white,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerB(Colors.white, 90, -40),
                chipText1: "From 9:00 AM to 5:00 PM",
                chipText2: "8 Hours",
                queueStatus: '1'),
            _card(
                primary: Colors.white,
                chipColor: LightColor.lightOrange,
                backWidget: _decorationContainerC(Colors.white, 50, -30),
                chipText1: "From 9:00 AM to 5:00 PM",
                chipText2: "8 Hours",
                queueStatus: '0'),
            _card(
                primary: Colors.white,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerD(LightColor.seeBlue, -50, 30,
                    secondary: LightColor.lightseeBlue,
                    secondaryAccent: LightColor.darkseeBlue),
                chipText1: "From 9:00 AM to 5:00 PM",
                chipText2: "8 Hours",
                queueStatus: '1'),
          ],
        ),
      ),
    );
  }

  Widget _featuredRowB() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _card(
                primary: LightColor.seeBlue,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerD(
                    LightColor.darkseeBlue, -100, -65,
                    secondary: LightColor.lightseeBlue,
                    secondaryAccent: LightColor.seeBlue),
                chipText1: "From 9:00 AM to 5:00 PM",
                chipText2: "8 Hours",
                isPrimaryCard: true,
                queueStatus: '1'),
            _card(
                primary: Colors.white,
                chipColor: LightColor.lightpurple,
                backWidget: _decorationContainerE(
                  LightColor.lightpurple,
                  90,
                  -40,
                  secondary: LightColor.lightseeBlue,
                ),
                chipText1: "From 9:00 AM to 5:00 PM",
                chipText2: "8 Hours",
                queueStatus: '1'),
            _card(
                primary: Colors.white,
                chipColor: LightColor.lightOrange,
                backWidget: _decorationContainerF(
                    LightColor.lightOrange, LightColor.orange, 50, -30),
                chipText1: "From 9:00 AM to 5:00 PM",
                chipText2: "8 Hours",
                queueStatus: '0'),
            _card(
                primary: Colors.white,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerA(
                  Colors.white,
                  -50,
                  30,
                ),
                chipText1: "From 9:00 AM to 5:00 PM",
                chipText2: "8 Hours",
                queueStatus: '1'),
          ],
        ),
      ),
    );
  }

  Widget _card(
      {Color primary = Colors.redAccent,
        String queueStatus,
        String chipText1 = '',
        String chipText2 = '',
        Widget backWidget,
        Color chipColor = LightColor.orange,
        bool isPrimaryCard = false}) {
    return Container(
        height: isPrimaryCard ? 190 : 180,
        width: isPrimaryCard ? width * .32 : width * .32,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: primary.withAlpha(200),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: LightColor.lightpurple.withAlpha(20))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                backWidget,
                Positioned(
                    top: 20,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: queueStatus == "0"
                          ? Colors.redAccent.withOpacity(0.5)
                          : Colors.greenAccent,
                      child: Icon(
                        queueStatus == "1" ? Icons.check : Icons.close,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: _cardInfo(chipText1, chipText2,
                      LightColor.titleTextColor, chipColor,
                      isPrimaryCard: isPrimaryCard),
                )
              ],
            ),
          ),
        ));
  }

  Widget _cardInfo(String title, String courses, Color textColor, Color primary,
      {bool isPrimaryCard = false}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            width: width * .32,
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryCard ? Colors.white : textColor),
            ),
          ),
          SizedBox(height: 5),
          _chip(courses, primary, height: 5, isPrimaryCard: isPrimaryCard)
        ],
      ),
    );
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

  Widget _decorationContainerA(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: primary.withAlpha(255),
          ),
        ),
        _smallContainer(primary, 20, 40),
        Positioned(
          top: 20,
          right: -30,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        )
      ],
    );
  }

  Widget _decorationContainerB(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -65,
          right: -65,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.blue.shade100,
            child: CircleAvatar(radius: 30, backgroundColor: primary),
          ),
        ),
        Positioned(
            top: 35,
            right: -40,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: LightColor.lightseeBlue, radius: 40)))
      ],
    );
  }

  Widget _decorationContainerC(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -105,
          left: -35,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: LightColor.orange.withAlpha(100),
          ),
        ),
        Positioned(
            top: 35,
            right: -40,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: LightColor.orange, radius: 40))),
        _smallContainer(
          LightColor.yellow,
          35,
          70,
        )
      ],
    );
  }

  Widget _decorationContainerD(Color primary, double top, double left,
      {Color secondary, Color secondaryAccent}) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: secondary,
          ),
        ),
        _smallContainer(LightColor.yellow, 18, 35, radius: 12),
        Positioned(
          top: 130,
          left: -50,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: primary,
            child: CircleAvatar(radius: 50, backgroundColor: secondaryAccent),
          ),
        ),
        Positioned(
          top: -30,
          right: -40,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        )
      ],
    );
  }

  Widget _decorationContainerE(Color primary, double top, double left,
      {Color secondary}) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -105,
          left: -35,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: primary.withAlpha(100),
          ),
        ),
        Positioned(
            top: 40,
            right: -25,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(backgroundColor: primary, radius: 40))),
        Positioned(
            top: 45,
            right: -50,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(backgroundColor: secondary, radius: 50))),
        _smallContainer(LightColor.yellow, 15, 90, radius: 5)
      ],
    );
  }

  Widget _decorationContainerF(
      Color primary, Color secondary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 25,
            right: -20,
            child: RotatedBox(
              quarterTurns: 1,
              child: ClipRect(
                  clipper: QuadClipper(),
                  child: CircleAvatar(
                      backgroundColor: primary.withAlpha(100), radius: 50)),
            )),
        Positioned(
            top: 34,
            right: -8,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: secondary.withAlpha(100), radius: 40))),
        _smallContainer(LightColor.yellow, 15, 90, radius: 5)
      ],
    );
  }

  Positioned _smallContainer(Color primary, double top, double left,
      {double radius = 10}) {
    return Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primary.withAlpha(255),
        ));
  }

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), title: Text(""));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    screenheigh = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerTemplate(userId: "user",)
            ],
          ),
        ),
        appBar: AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Image.asset(
                    '${Strings().addIcon}',
                    width: 40.0,
                    height: 30.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetupNewRequest()));
                  }),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                    height: 150.0,
                    width: 30.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.redAccent,
                              size: 25.0,
                            ),
                            onPressed: () {
                              showOverlayNotification((context) {
                                return Card(
                                  margin:
                                  const EdgeInsets.symmetric(horizontal: 4),
                                  child: SafeArea(
                                    child: ListTile(
                                      leading: SizedBox.fromSize(
                                          size: const Size(40, 40),
                                          child: ClipOval(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomCenter,
                                                    colors: <Color>[
                                                      Color(0xff298cb6),
                                                      Color(0xff095365)
                                                    ],
                                                  ),
                                                ),
                                              ))),
                                      title: Text('Online Queue Team'),
                                      subtitle: Text(
                                          'Request For Service # 01 Installed Succeffully'),
                                      trailing: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            OverlaySupportEntry.of(context)
                                                .dismiss();
                                          }),
                                    ),
                                  ),
                                );
                              }, duration: Duration(milliseconds: 9000));
                            },
                          ),
                          list.length == 0
                              ? Container()
                              : Positioned(
                              child: Stack(
                                children: <Widget>[
                                  Icon(Icons.brightness_1,
                                      size: 20.0, color: Colors.amber),
                                  Positioned(
                                      top: 4.0,
                                      right: 6.0,
                                      child: Center(
                                        child: Text(
                                          list.length.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                ],
                              )),
                        ],
                      ),
                    )),
              ),
            ],
            flexibleSpace: Container(
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
            ),
            leading: IconButton(
                icon: Image.asset(
                  '${Strings().menuImg}',
                  width: 40.0,
                  height: 23.0,
                ),
                onPressed: () => {_scaffoldKey.currentState.openDrawer()}),
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Online Queue",
              style: TextStyle(
                  fontSize: 27.0,
                  color: Color(0xffeeeeee),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kufi'),
            )),
        body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xff095365).withOpacity(0.2),
                      Color(0xff01b6ad).withOpacity(0.5)
                    ],
                  )),
              child: Column(
                children: <Widget>[
                  _header(context),
                  SizedBox(height: 20),
                  _categoryRow(
                      "Confiremd Requests", LightColor.orange, LightColor.orange),
                  _featuredRowA(),
                  SizedBox(height: 0),
                  _categoryRow("Request Already Done", LightColor.purple, LightColor.darkpurple),
                  _featuredRowB()
                ],
              ),
            )));
  }
}
