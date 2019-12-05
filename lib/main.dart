import 'package:flutter/material.dart';
import 'authentication.dart';
import 'login.dart';
import 'root_page.dart';


/// google green
/// Color(0xff1aa260)
/// yellow
/// Color(0xffffce44)
/// red
/// Color(0xffde5246)
/// blue Color(0xff4c8bf5)
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hack Water',
      theme: ThemeData(
        cursorColor:Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Color(0xffE7CFFF),
        bottomAppBarColor: Color(0xff120023),
        dividerColor:Color(0xffE7CFFF),
        primarySwatch: Colors.blue,
        buttonTheme:ButtonThemeData(
            buttonColor: Colors.blue),
        accentColorBrightness: Brightness.dark,
        textTheme:TextTheme(
//            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic,color:Color(0xff120023)),
          body1: TextStyle( fontFamily: 'Montserrat'),
        ),
      ),
      home: new RootPage(auth: new Auth()),
    );
  }
}

