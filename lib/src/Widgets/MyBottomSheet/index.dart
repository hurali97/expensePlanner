import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  _showPressed() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (context) => Container(
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
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.5, color: Colors.grey[200]))),
                  ),
                  Container(
                    width:  MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.symmetric(vertical:15),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          hintText: 'Enter a search term'),
                    ),
                  ),
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
