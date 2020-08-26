import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../Widgets/MyCard/index.dart';
import 'package:expensePlanner/src/Widgets/MyBottomSheet/index.dart';
import 'package:expensePlanner/src/Classes/BarModel.dart';

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
    // var data = [
    //   BarModel('2016', 12, Colors.red),
    //   BarModel('2017', 42, Colors.yellow),
    //   BarModel('2018', 62, Colors.green),
    //   BarModel('2019', 72, Colors.red),
    //   BarModel('2020', 22, Colors.yellow),
    //   BarModel('2021', 92, Colors.green),
    // ];

    List<BarModel> convertToArray() {
      List days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
      List colors = [
        Colors.blue,
        Colors.deepOrange[300],
        Colors.green,
        Colors.pink,
        Colors.yellow,
        Colors.purple,
        Colors.red
      ];

      int monthDay = (new DateTime.now()).day;

      List<BarModel> convertedArray = [];

      for (var i = 0; i < expenses.length; i++) {
        int _expenseDay =
            int.parse(expenses.elementAt(i)['date'].split('-').elementAt(2));

        if ((monthDay - _expenseDay) < 7) {
          convertedArray.add(BarModel(
            days[DateTime.parse(expenses.elementAt(i)['date']).weekday],
            int.parse(expenses.elementAt(i)['amount']),
            colors[DateTime.parse(expenses.elementAt(i)['date']).weekday],
          ));
        }
      }

      return convertedArray;
    }

    var series = [
      charts.Series(
        domainFn: (BarModel clickData, _) => clickData.day,
        measureFn: (BarModel clickData, _) => clickData.amount,
        colorFn: (BarModel clickData, _) => clickData.color,
        id: 'Days',
        data: convertToArray(),
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    List<Widget> _buildCards() {
      return [
        ...(expenses).map((_expense) {
          return MyCard(
              _expense['title'], _expense['date'], _expense['amount']);
        }).toList()
      ];
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: expenses.length > 0
          ? SingleChildScrollView(child:Column(
              children: [
                // Text('Transactions'),
                chartWidget,
                ..._buildCards()
              ],
            )
          )
          : Container(
              child: Text(
                'No expenses added',
                textAlign: TextAlign.center,
              ),
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
            ),
      floatingActionButton: MyBottomSheet(_addExpense),
    );
  }
}
