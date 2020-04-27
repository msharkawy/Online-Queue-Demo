import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinequeue/src/helpers/helpers.dart';
import 'package:onlinequeue/src/resources/strings.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:onlinequeue/src/ui/pages/home_page.dart';
import 'package:onlinequeue/src/ui/widgets/shared.dart';
import 'package:overlay_support/overlay_support.dart';

class SetupNewQueue extends StatefulWidget {
  SetupNewQueue({Key key}) : super(key: key);

  @override
  _SetupNewQueueState createState() => _SetupNewQueueState();
}

class _SetupNewQueueState extends State<SetupNewQueue> {
  List list = ['1', '2', '1', '2', '1', '2', '1', '2', '1', '2', '1', '2'];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _startTime = "";
  String _endTime = "";

  List<TestModel> _cats = TestModel.GetCats();
  List<DropdownMenuItem<TestModel>> _dropdownMenuItems;
  TestModel _selectedCat;

  List<TestModel> _branch = TestModel.GetBranches();
  List<DropdownMenuItem<TestModel>> _dropdownMenuBranchItems;
  TestModel _selectedBranch;

  List<TestModel> _sp = TestModel.GetServiceProviders();
  List<DropdownMenuItem<TestModel>> _dropdownMenuSPItems;
  TestModel _selectedSp;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_cats);
    _selectedCat = _dropdownMenuItems[0].value;
    _dropdownMenuBranchItems = buildDropdownMenuItems(_branch);
    _selectedBranch = _dropdownMenuBranchItems[0].value;
    _dropdownMenuSPItems = buildDropdownMenuItems(_sp);
    _selectedSp = _dropdownMenuSPItems[0].value;

    super.initState();
  }

  List<DropdownMenuItem<TestModel>> buildDropdownMenuItems(List listItems) {
    List<DropdownMenuItem<TestModel>> items = List();
    for (TestModel item in listItems) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(item.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(TestModel selectedCategory) {
    setState(() {
      _selectedCat = selectedCategory;
    });
  }

  onChangeDropdownItemBranch(TestModel selectedBranch) {
    setState(() {
      _selectedBranch = selectedBranch;
    });
  }

  onChangeDropdownItemSP(TestModel selectedServiceProvoder) {
    setState(() {
      _selectedSp = selectedServiceProvoder;
    });
  }

  //Time

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheigh = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff00bcd4).withOpacity(0.6),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerTemplate(userId: "company")
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            //First Child
            SliverAppBar(
                elevation: 0.0,
                leading: IconButton(
                    icon: Image.asset(
                      '${Strings().menuImg}',
                      width: 40.0,
                      height: 23.0,
                    ),
                    onPressed: () => {_scaffoldKey.currentState.openDrawer()}),
                floating: true,
                actions: <Widget>[
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
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
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
                                              'Request For Queue # 01 Installed Succeffully'),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )),
                                      ],
                                    )),
                            ],
                          ),
                        )),
                  )
                ],
                title: Text(
                  "Online Queue",
                  style: TextStyle(
                      fontSize: 27.0,
                      color: Color(0xff095365),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kufi'),
                ),
                centerTitle: true,
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 150,
                backgroundColor: Color(0xff01b6ad).withOpacity(0.5),
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          '${Strings().homeBar}',
                          fit: BoxFit.fill,
                        ),
                        DecoratedBox(
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
                        ),
                      ],
                    ))),
            // Next, create a SliverList
//            SliverList(
//              // Use a delegate to build items as they're scrolled on screen.
//              delegate: SliverChildBuilderDelegate(
//                (context, index) => ListTile(title: Text('Item #$index')),
//                // Builds 1000 ListTiles
//                childCount: 20,
//              ),
//            ),

            //Second Child start here

            SliverToBoxAdapter(
              child: Container(
                  alignment: Alignment.center,
                  width: screenWidth,
                  height: screenheigh * 0.08,
                  color: Colors.black54.withOpacity(0.1),
                  child: Text(
                    'Setup Queue',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Monister',
                        color: Colors.white60),
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                  width: screenWidth,
//                  height: screenheigh * 0.2,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: <Widget>[
                      //First Row

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.0, bottom: 3.0),
                                    child: Text(
                                      'Select Category',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Monister',
                                          color: Colors.white60),
                                    )),
                                Container(
                                  width: screenWidth,
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          color:
                                              Colors.black45.withOpacity(0.2))),
                                  child: DropdownButtonFormField(
                                    decoration:
                                        InputDecoration.collapsed(hintText: ''),
                                    elevation: 0,
//                                  isDense: true,
                                    isExpanded: false,
                                    iconEnabledColor: Color(0xff444444),
                                    icon: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                    style: TextStyle(
                                        color: Colors.black54,
//                                    fontFamily: 'Monister',
                                        fontSize: 16.0,
                                        decorationColor: Colors.green
//                                    fontWeight: FontWeight.bold
                                        ),
                                    value: _selectedCat,
                                    items: _dropdownMenuItems,
                                    onChanged: onChangeDropdownItem,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 5.0, bottom: 3.0),
                                  child: Text(
                                    'Select Service Provider',
                                    style: TextStyle(
                                        fontSize: 19.0,
                                        fontFamily: 'Monister',
                                        color: Colors.white60),
                                  ),
                                ),
                                Container(
                                  width: screenWidth,
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          color:
                                              Colors.black45.withOpacity(0.2))),
                                  child: DropdownButtonFormField(
                                    decoration:
                                        InputDecoration.collapsed(hintText: ''),
                                    elevation: 0,
//                                  isDense: true,
                                    isExpanded: false,
                                    iconEnabledColor: Color(0xff444444),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                    style: TextStyle(
                                        color: Colors.black54,
//                                    fontFamily: 'Monister',
                                        fontSize: 16.0,
                                        decorationColor: Colors.green
//                                    fontWeight: FontWeight.bold
                                        ),
                                    value: _selectedSp,
                                    items: _dropdownMenuSPItems,
                                    onChanged: onChangeDropdownItemSP,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      //Second Row
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.0, bottom: 3.0),
                                    child: Text(
                                      'Select Branch',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Monister',
                                          color: Colors.white60),
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth,
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                            color: Colors.black45
                                                .withOpacity(0.2))),
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: ''),
                                      elevation: 0,
//                                  isDense: true,
                                      isExpanded: false,
                                      iconEnabledColor: Color(0xff444444),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                      style: TextStyle(
                                          color: Colors.black54,
//                                    fontFamily: 'Monister',
                                          fontSize: 16.0,
                                          decorationColor: Colors.green
//                                    fontWeight: FontWeight.bold
                                          ),
                                      value: _selectedBranch,
                                      items: _dropdownMenuBranchItems,
                                      onChanged: onChangeDropdownItemBranch,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Third Row

                      Container(
                        width: screenWidth,
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 15.0),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.black45.withOpacity(0.05),
                            border: Border.all(
                                color: Colors.black12.withOpacity(0.05),
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: screenWidth,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Color(0xffcccccc),
                                          width: 0.7)),
                                  child: TextFormField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                        hintText: "Queue Length",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.withOpacity(0.5),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Monister'),
                                        border: InputBorder.none,
                                      )),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: screenWidth,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Color(0xffcccccc),
                                          width: 0.7)),
                                  child: TextFormField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                        hintText: "Service Time",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.withOpacity(0.5),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Monister'),
                                        border: InputBorder.none,
                                      )),
                                ))
                          ],
                        ),
                      ),

                      //Fouth Row

                      Container(
                        width: screenWidth,
                        margin: EdgeInsets.only(
                          top: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.0, bottom: 3.0),
                                      child: Text(
                                        'Queue Start Time',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'Monister',
                                            color: Colors.white60),
                                      )),
                                  Container(
                                    width: screenWidth,
                                    alignment: Alignment.center,
                                    height: 40.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color:
                                            Color(0xff095365).withOpacity(0.3),
                                        border: Border.all(
                                            color: Colors.black45
                                                .withOpacity(0.2))),
                                    child: MaterialButton(
                                      onPressed: () {
                                        DatePicker.showTime12hPicker(context,
                                            showTitleActions: true,
                                            onChanged: (date) {},
                                            onConfirm: (startTime) {
//                                            print(startTime);
                                          setState(() {
                                            _startTime = DateFormat()
                                                .add_jm()
                                                .format(startTime);
                                          });
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.en);
                                      },
                                      child: Text(
                                        '${_startTime == "" ? "Q Start Time" : _startTime}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.0, bottom: 3.0),
                                      child: Text(
                                        'Queue End Time',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'Monister',
                                            color: Colors.white60),
                                      )),
                                  Container(
                                    width: screenWidth,
                                    alignment: Alignment.center,
                                    height: 40.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color:
                                            Color(0xff095365).withOpacity(0.3),
                                        border: Border.all(
                                            color: Colors.black45
                                                .withOpacity(0.2))),
                                    child: MaterialButton(
                                      onPressed: () {
                                        DatePicker.showTime12hPicker(context,
                                            showTitleActions: true,
                                            onChanged: (date) {},
                                            onConfirm: (startTime) {
//                                            print(startTime);
                                          setState(() {
                                            _endTime = DateFormat()
                                                .add_jm()
                                                .format(startTime);
                                          });
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.en);
                                      },
                                      child: Text(
                                        '${_endTime == "" ? "Q End Time" : _endTime}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Fifth Child

                      Container(
                          width: screenWidth,
                          margin: EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: screenWidth,
                                      margin: EdgeInsets.only(
                                          bottom: 10.0,
                                          left: 10.0,
                                          right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Color(0xff01b6ad).withOpacity(0.6),
                                            Color(0xff095365).withOpacity(0.6),
                                          ],
                                        ),
                                      ),
                                      height: 50.0,
                                      child: MaterialButton(
                                        onPressed: () async{
                                          showInSnackBar('Queue Setup Sent Successfully',Colors.green);
                                          await Future.delayed(Duration(seconds: 5));
                                          Navigator.of(context)
                                              .pushReplacement(MaterialPageRoute(builder: (context) => HomePage(userId: "company",)));
                                        },
                                        elevation: 0.0,
                                        child: Text(
                                          'Submit Queue',
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      margin: EdgeInsets.only(
                                          bottom: 10.0,
                                          left: 10.0,
                                          right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Colors.redAccent.withOpacity(0.6),
                                            Colors.deepOrange.withOpacity(0.6),
                                          ],
                                        ),
                                      ),
                                      height: 50.0,
                                      child: MaterialButton(
                                        onPressed: (){
                                          Navigator.of(context)
                                              .pushReplacement(MaterialPageRoute(builder: (context) => HomePage(userId: "user",)));
                                        },
                                        elevation: 0.0,
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 18.0,
                                              fontFamily: 'Monister',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                    )),
                              ]))
                    ],
                  )),
            )
          ],
        ));
  }


  void showInSnackBar(String value,Color backColors) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: backColors,
      duration: Duration(seconds: 3),
    ));
  }

}
