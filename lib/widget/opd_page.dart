import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unghopital/utility/my_constant.dart';
import 'package:unghopital/widget/new_page.dart';

class OpdPage extends StatefulWidget {
  @override
  _OpdPageState createState() => _OpdPageState();
}

class _OpdPageState extends State<OpdPage> {

  Widget currentWidget = Text('ยังไม่ได้คลิกเลย');
  Color color = Colors.pink.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          buildColumn1(),
          buildColumn2(),
        ],
      ),
    );
  }

  Widget buildColumn2() => Card(
        color: Colors.yellow.shade300,
        child: Container(
          padding: EdgeInsets.all(MyConstant().myPadding),
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              Row(
                children: [
                  buildNode2(Icons.android, 'ทะเบียนผู้ป่วยใหม่'),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  buildNode2(Icons.android, 'ทะเบียนผู้ป่วยใหม่'),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  buildNode2(Icons.android, 'ทะเบียนผู้ป่วยใหม่'),
                ],
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Row(
                children: [
                  buildNode2(Icons.android, 'ทะเบียนผู้ป่วยใหม่'),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  buildNode2(Icons.android, 'ทะเบียนผู้ป่วยใหม่'),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  buildNode2(Icons.android, 'ทะเบียนผู้ป่วยใหม่'),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildColumn1() => Column(
    children: [
      Card(
            color: Colors.green.shade200,
            child: Container(
              padding: EdgeInsets.all(MyConstant().myPadding),
              width: MediaQuery.of(context).size.width * 0.5,height: 300,
              child: GridView.extent(
                maxCrossAxisExtent: 160,
                children: [
                  buildNode(Icons.android, 'ทะเบียนผู้ป่วยใหม่', 'dog'),
                  buildNode(Icons.account_box, 'Refer', 'cat'),
                  buildNode(Icons.android, 'ทะเบียนผู้ป่วยใหม่2', 'dog'),
                  buildNode(Icons.account_box, 'Refer2', 'cat'),
                  buildNode(Icons.android, 'ทะเบียนผู้ป่วยใหม่3', 'dog'),
                  buildNode(Icons.account_box, 'Refer3', 'cat'),
                ],
              ),
            ),
          ),
      Expanded(child: Center(child: currentWidget,),),
    ],
  );

  Widget buildNode(IconData iconData, String string, String show) => GestureDetector(
        onTap: () {
          print('You Click ==>> $string');

//          MaterialPageRoute route = MaterialPageRoute(builder: (context) => NewPage(),);
//          Navigator.push(context, route);

         setState(() {


           if (show == 'dog') {
             currentWidget = Container(height: 280,child: Image.asset('images/dog.png'),);
           }  else if (show == 'cat') {
             currentWidget = Container(height: 280,child: Image.asset('images/cat.png'),);
           } else {
             currentWidget = Text('ไม่มีภาพ');
           }
         });


        },
        child: Card(color: color,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  size: 48,
                ),
                Text(string),
              ],
            ),
          ),
        ),
      );

  Widget buildNode2(IconData iconData, String string) => Container(
        width: 100,
        height: 100,
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  size: 48,
                ),
                Text(string),
              ],
            ),
          ),
        ),
      );
}
