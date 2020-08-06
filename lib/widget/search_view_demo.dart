import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewDemo extends StatefulWidget {
  @override
  _SearchViewDemoState createState() => _SearchViewDemoState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback voidCallback;
  Timer timer;

  Debouncer({this.milliseconds});

  run(VoidCallback voidCallback) {
    if (timer != null) {
      timer.cancel();
    }
    timer = Timer(Duration(microseconds: milliseconds), voidCallback);
  }
}

class _SearchViewDemoState extends State<SearchViewDemo> {
  List<String> words = [
    'aaaa',
    'bbbb',
    'cccc',
    'abaa',
    'acaa',
    'aabc',
    'dddd',
    'eeee',
    'abca',
    'abcd',
    'ffff'
  ];

  List<String> words2 = List();
  final Debouncer debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    words2 = words;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildSearch(),
            buildListView(),
          ],
        ),
      ),
    );
  }

  Widget buildListView() => Expanded(
        child: ListView.builder(
          itemCount: words2.length,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(words2[index]),
            ],
          ),
        ),
      );

  Widget buildSearch() => Container(
        margin: EdgeInsets.only(top: 50),
        width: 250,
        child: TextField(onChanged: (value) {
          debouncer.run(() {
            setState(() {
//              words2 = words
            });
          });
        },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
}
