import 'package:flutter/material.dart';
import 'package:onlinequeue/src/resources/strings.dart';
import 'package:onlinequeue/src/ui/pages/home_page.dart';
import 'package:onlinequeue/src/ui/pages/login_page.dart';
import 'package:onlinequeue/src/ui/pages/user_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DrawerTemplate extends StatelessWidget {
  final String userId;
  DrawerTemplate({this.userId});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.27,
            padding: EdgeInsets.only(left: 15.0),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //First Child
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Welcome ',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff095365),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Monister'),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '${userId == "user" ? 'User Name' : 'Company Name' }',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffeeeeee),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Monister'),
                      ),
                    )
                  ],
                ),

                //Second Child
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white,
                            image: DecorationImage(
                                image:
                                AssetImage('${Strings().userAvatar}'),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${userId == "user" ? 'user@user.com' : 'Sp@sp.com' }',
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16.0,
                                  fontFamily: 'Monister',
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '+966 57 098 4391',
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16.0,
                                  fontFamily: 'Monister',
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              if(userId == "user"){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserHomePage()));
              }else{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monister'),
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.black.withOpacity(0.5),
                size: 25.0,
              ),
            ),
          ),
          Divider(),
          GestureDetector(
              onTap: () {
                if(userId == "user"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserHomePage()));
                }else{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monister'),
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black.withOpacity(0.5),
                  size: 25.0,
                ),
              )),
          Divider(),
          GestureDetector(
              onTap: () {
                if(userId == "user"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserHomePage()));
                }else{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monister'),
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black.withOpacity(0.5),
                  size: 25.0,
                ),
              )),
          Divider(),
          GestureDetector(
              onTap: () {
                if(userId == "user"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserHomePage()));
                }else{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text(
                  'Help',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monister'),
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black.withOpacity(0.5),
                  size: 25.0,
                ),
              )),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: ListTile(
              leading: Icon(FontAwesomeIcons.signOutAlt, color: Colors.redAccent.withOpacity(0.5)),
              title: Text(
                'Logout',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monister'),
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: Colors.redAccent.withOpacity(0.5),
                size: 25.0,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
