import 'package:flutter/material.dart';

import '../../Widgets/MyCard/index.dart';
import 'package:expensePlanner/src/Widgets/MyBottomSheet/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> expenses;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    expenses = [];
  }

  void _addExpense(String title, String amount, String date) {
    setState(() {
      expenses.add({
        'title': title,
        'amount': amount,
        'date': date,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          Text('Transactions'),

          ...(expenses).map((_expense) {
            return MyCard(
                _expense['title'], _expense['date'], _expense['amount']);
          }).toList()
          // MyCard(),
          // MyCard(),
          // MyCard(),
        ],
      ),
      floatingActionButton: MyBottomSheet(_addExpense),
    );
  }
}
