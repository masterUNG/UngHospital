import 'package:flutter/material.dart';
import 'package:unghopital/widget/home.dart';
import 'package:unghopital/widget/input_form.dart';
import 'package:unghopital/widget/list_data.dart';
import 'package:unghopital/widget/opd_page.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<Widget> myWidgets = [Home(),OpdPage(), InputForm(), ListData()];
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
              showInputForm(),
              Text('ListData', style: TextStyle(fontSize: 20),),
            ],
          ),
        ),body: TabBarView(children: myWidgets,),
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
