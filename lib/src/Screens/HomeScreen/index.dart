import 'package:flutter/material.dart';

import '../../Widgets/MyCard/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Transactions'),
        MyCard(),
        MyCard(),
        MyCard(),
      ],
    );
  }
}
