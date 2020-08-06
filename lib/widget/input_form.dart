import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String name, nationChoose, surname, address;
//  List<String> nations = ['Thailand', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England', 'Usa', 'England'];
  List<String> nations2 = ['aaa', 'bbb', 'bbb2', 'bbb3', 'bbb4', 'bbb5', 'bbb6', 'bbb7', 'bbb8', 'bbb9', 'bbb19', 'bbb29', 'bbb39', 'bbb49'];

  List<Map<String, dynamic>> maps = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(

        children: [
          buildContainer(),
          buildNameForm(),
          buildSurNameForm(),
          buildAddressForm(),
          buildDropDown(),
          buildRaisedButton(),
        ],
      )),
    );
  }

  Widget buildContainer() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(color: Colors.amber,
              child: SizedBox(
                width: 250,
                height: 400,
              ),
            ),
      ],
    );
  }

  Widget buildDropDown() => Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
            width: 250,
            child: DropdownButton<String>(
              value: nationChoose,
              items: nations2
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ),
                  )
                  .toList(),
              hint: Text('Please Choose Nation'),
              onChanged: (value) {
                setState(() {
                  nationChoose = value;
                });
              },
            ),
          ),
    ],
  );

  RaisedButton buildRaisedButton() {
    return RaisedButton(
      child: Text('Save'),
      onPressed: () {
        print('You Press Button name = $name, surname = $surname, address = $address, nationChoose = $nationChoose');

        Map<String, dynamic> map = Map();
        map['name'] = name;
        map['surname'] = surname;
        map['address'] = address;
        map['nation'] = nationChoose;

        print('Json Post to Server ==>> $map');

        for (int i=0; i< 3; i++) {
          maps.add(map);
        }

        postData(maps);


      },
    );
  }

  Future<Null> postData(List<Map<String, dynamic>> post)async{
    print('post to Server ==>> ${post.toString()}');

    String url = '';
    Response response = await http.post(url, body: post);

  }

  Container buildNameForm() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) {
          name = value.trim();
        },
        decoration: InputDecoration(
          labelText: 'Name :',
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildSurNameForm() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) {
          surname = value.trim();
        },
        decoration: InputDecoration(
          labelText: 'SurName :',
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildAddressForm() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) {
          address = value.trim();
        },
        decoration: InputDecoration(
          labelText: 'Address :',
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
