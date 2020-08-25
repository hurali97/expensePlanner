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
    var data = [
      BarModel('2016', 12, Colors.red),
      BarModel('2017', 42, Colors.yellow),
      BarModel('2018', 62, Colors.green),
      BarModel('2019', 72, Colors.red),
      BarModel('2020', 22, Colors.yellow),
      BarModel('2021', 92, Colors.green),
    ];

    var series = [
      charts.Series(
        domainFn: (BarModel clickData, _) => clickData.year,
        measureFn: (BarModel clickData, _) => clickData.clicks,
        colorFn: (BarModel clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          // Text('Transactions'),
          chartWidget,

          expenses.length > 0
              ? {
                  ...(expenses).map((_expense) {
                    return MyCard(_expense['title'], _expense['date'],
                        _expense['amount']);
                  }).toList()
                }
              : Container(
                  child: Text(
                    'No expenses added',
                    textAlign: TextAlign.center,
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                )
        ],
      ),
      floatingActionButton: MyBottomSheet(_addExpense),
    );
  }
}
