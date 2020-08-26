import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:expensePlanner/src/Widgets/TransparentButton/index.dart';
import 'package:expensePlanner/src/Widgets/MyInputField/index.dart';
import 'package:expensePlanner/src/Widgets/MyButton/index.dart';

class MyBottomSheet extends StatefulWidget {
  final Function onCreateHandler;

  MyBottomSheet(this.onCreateHandler);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyBottomSheetState();
  }
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  String _title = "", _amount = '', _selectedDate = '';

  @override
  void initState() {
    super.initState();

    _selectedDate = 'Select date';
  }

  _onChangeTitle(Function setState, String text) {
    setState(() {
      _title = text;
    });
  }

  _onChangeAmount(Function setState, String text) {
    setState(() {
      _amount = text;
    });
  }

  Future<void> _onDatePressed(Function setState) async {
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

  _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.CENTER,
      // timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[700],
      textColor: Colors.white,
      // fontSize: 16.0
    );
  }

  _onCreate(Function setState) {
    if (_title.trim() == '') {
      _showToast("Enter title");
      return;
    } else if (_amount.trim() == '') {
      _showToast("Enter amount");
      return;
    } else if (_selectedDate.trim() == '') {
      _showToast("Select a date");
      return;
    } else if (_selectedDate == 'Select date') {
      _showToast("Select a date");
      return;
    } else {
      widget.onCreateHandler(_title, _amount, _selectedDate);

      setState(() {
        
        _title = _amount = '';
        _selectedDate = 'Select date';
        
      });

      Navigator.pop(context);
    }
  }

  _showPressed() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (BuildContext context) => StatefulBuilder(
              builder: (BuildContext context, setState) => Container(
                // color: Colors.grey[900],
                height: 450,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Add Transaction',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontFamily: 'PTSans',
                        fontSize: 20, 
                      ),
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
                      onChangeText: (String text) =>
                          _onChangeTitle(setState, text),
                    ),
                    MyInputField(
                      placeHolder: 'Enter Amount',
                      label: 'Amount',
                      icon: Icons.attach_money,
                      onChangeText: (String text) =>
                          _onChangeAmount(setState, text),
                      keyboardType: TextInputType.number,
                    ),
                    TransparentButton(
                        () => _onDatePressed(setState), _selectedDate),
                    MyButton(() => _onCreate(setState)),
                    // MyInputField(),
                  ],
                ),
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
