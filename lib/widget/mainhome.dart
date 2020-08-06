import 'package:flutter/material.dart';
import 'package:unghopital/widget/home.dart';
import 'package:unghopital/widget/input_form.dart';
import 'package:unghopital/widget/list_data.dart';
import 'package:unghopital/widget/opd_page.dart';
import 'package:unghopital/widget/query_demo.dart';
import 'package:unghopital/widget/search_view_demo.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<Widget> myWidgets = [
    Home(),
    OpdPage(),
    InputForm(),
    SearchViewDemo(),
    ListData(),
    QueryDemo(),
  ];
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
              Text('ผู้ป่วยนอก'),
              showInputForm(),Text('Search View'),
              Text(
                'ListData',
                style: TextStyle(fontSize: 20),
              ),
              Text('Query Demo'),
            ],
          ),
        ),
        body: TabBarView(
          children: myWidgets,
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
          Text('Input Form'),
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
