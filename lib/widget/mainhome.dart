import 'package:flutter/material.dart';
import 'package:unghopital/widget/home.dart';
import 'package:unghopital/widget/input_form.dart';
import 'package:unghopital/widget/list_data.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<Widget> myWidgets = [Home(), InputForm(), ListData()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabController(),
    );
  }

  Widget tabController() {
    return DefaultTabController(
      length: myWidgets.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ung Hospital'),
          bottom: TabBar(
            tabs: [
              showIcon(),
              showInputForm(),
              Text('ListData', style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }

  Widget showInputForm() => Column(
        children: [
          Container(
            width: 36,
            child: Image.asset('images/home.png'),
          ),
          Text('InputForm'),
        ],
      );

  Widget showIcon() => Column(
        children: [
          Icon(
            Icons.accessible_forward,
            size: 36,
          ),
          Text('Home'),
        ],
      );
}
