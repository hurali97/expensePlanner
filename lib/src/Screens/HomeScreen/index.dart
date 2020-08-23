import 'package:flutter/material.dart';

import '../../Widgets/MyCard/index.dart';
import 'package:expensePlanner/src/Widgets/MyBottomSheet/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _selectedDate = 'Select date';

  _onDateSelect(String text) {
    setState(() {
      _selectedDate = text;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('Transactions'),
          MyCard(),
          MyCard(),
          MyCard(),
        ],
      ),
      floatingActionButton: MyBottomSheet(),
    );
  }
}
