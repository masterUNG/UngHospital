import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:unghopital/models/demo_model.dart';

class QueryDemo extends StatefulWidget {
  @override
  _QueryDemoState createState() => _QueryDemoState();
}

class _QueryDemoState extends State<QueryDemo> {
  String number;

  DemoModel demoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildRow(),
          showResult(),
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: [
        Container(
          width: 150,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) => number = value.trim(),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        OutlinedButton(
            onPressed: () {
              readData();
            },
            child: Text('Send'))
      ],
    );
  }

  Future<Null> readData() async {
    if (number != null) {
      String url = 'https://jsonplaceholder.typicode.com/todos/$number';
      Response response = await http.get(url);
      var result = json.decode(response.body);
      print('result = $result');
      setState(() {
        if (result.toString() == '{}') {
          showAlert();
        } else {
          demoModel = DemoModel.fromJson(result);
        }
      });
    }
  }

  Widget showResult() {
    return Text(demoModel == null
        ? 'กรุณากรอกเลข และ Send'
        : 'title ==> ${demoModel.title}');
  }

  Future<Null> showAlert() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('ให้กรอกเฉพาะ ตัวเลขคะ'),
        children: [FlatButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('OK'))],
      ),
    );
  }
}
