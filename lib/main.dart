import 'package:flutter/material.dart';
import 'package:onlinequeue/src/theme/theme.dart';
import 'package:onlinequeue/src/ui/app.dart';
import './src/resources/strings.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Online Queue',
          theme: AppTheme.lightTheme,
          home: StartPoint(),
        )
    );
  }
}
