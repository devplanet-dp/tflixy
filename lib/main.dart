import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflixy/screens/home_screen.dart';

import 'util/theme.dart';

final ThemeData _AppTheme = CustomAppTheme().data;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      systemNavigationBarColor: Colors.blue, // navigation bar color
//      statusBarColor: Colors.pink, // status bar color
//    ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _AppTheme,
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
//        VideoApp.route: (ctx) => VideoApp(),
      },
    );
  }
}


