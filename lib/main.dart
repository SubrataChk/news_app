import 'package:flutter/material.dart';
import 'package:new_app/screen/homepage.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'New Application',
          theme: ThemeData.light(),
          home: HomePage(),
        );
      },
    );
  }
}
