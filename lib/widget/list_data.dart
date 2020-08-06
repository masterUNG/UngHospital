import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:unghopital/models/data_model.dart';

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List<DataModel> dataModels = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dataModels.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              color:
                  index % 2 == 0 ? Colors.blue.shade100 : Colors.blue.shade300),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(dataModels[index].title),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 160,
                child: Image.network(dataModels[index].thumbnailUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> readDataFromAPI() async {
    String urlAPI = 'https://jsonplaceholder.typicode.com/photos';
    Response response =
        await http.get(urlAPI, headers: {"Accept": "application/json"});
//    print('response StatusCode ===>>> ${response.statusCode}');

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
//      print('result ==>> $result');

      for (var map in result) {
        DataModel model = DataModel.fromJson(map);
        setState(() {
          dataModels.add(model);
        });
      }
    }
  }
}
