import 'package:flutter/material.dart';
import 'package:unghopital/widget/mainhome.dart';


main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainHome(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
