import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unghopital/utility/my_constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          leftContent(),
          rightContent(),
        ],
      ),
    );
  }

  Widget rightContent() => Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Image.asset('images/doctor.jpg'),
      );

  Widget leftContent() => Container(
        padding: EdgeInsets.all(60),
        width: MediaQuery.of(context).size.width * 0.5,
//        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Heading',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Text(MyConstant().content1),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Text(MyConstant().content1),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Text(MyConstant().content1),
              ),
            ],
          ),
        ),
      );
}
