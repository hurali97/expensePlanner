import 'package:flutter/material.dart';
import 'dart:async';

import 'package:expensePlanner/src/Widgets/TransparentButton/index.dart';
import 'package:expensePlanner/src/Widgets/MyInputField/index.dart';

class MyBottomSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyBottomSheetState();
  }
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  String _title = "", _amount = '', _selectedDate = 'Select date';

  _onChangeTitle(String text) {
    setState(() {
      _title = text;
    });
  }

  _onChangeAmount(String text) {
    setState(() {
      _amount = text;
    });
  }

  Future<void> _onDatePressed() async {
    final DateTime datePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2101));

    if (datePicked != null) {
      setState(() {
        _selectedDate = datePicked.toString().split(' ')[0];
      });
    } else {
      setState(() {
        _selectedDate = 'Select date';
      });
    }
  }

  _onCreate() {
    this.setState(() {
      this._selectedDate =  'Select a date';
    });
  }

  _showPressed() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (BuildContext context) => Container(
              // color: Colors.grey[900],
              height: 450,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Add Transaction',
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(bottom: 10),
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.5,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                  MyInputField(
                    placeHolder: 'Enter Title',
                    label: 'Title',
                    icon: Icons.description,
                    onChangeText: _onChangeTitle,
                  ),
                  MyInputField(
                    placeHolder: 'Enter Amount',
                    label: 'Amount',
                    icon: Icons.attach_money,
                    onChangeText: _onChangeAmount,
                  ),
                  TransparentButton(this._onCreate, _selectedDate)
                  // MyInputField(),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _showPressed,
      tooltip: 'Increment',
      child: Icon(Icons.add),
      // backgroundColor: Colors.lime,
    );
  }
}
