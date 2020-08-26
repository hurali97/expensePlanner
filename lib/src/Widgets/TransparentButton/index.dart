import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final Function onPressHandler;
  final String selectedDate;

  TransparentButton(this.onPressHandler, this.selectedDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: OutlineButton(
        child: Text(
          selectedDate,
          style: TextStyle(
            fontFamily: 'PTSans',
            fontSize: 16,
          ),
        ),
        onPressed: onPressHandler,
        borderSide: BorderSide(color: Colors.green[300]),
        padding: EdgeInsets.all(15),
        disabledBorderColor: Colors.green[300],
        textColor: Colors.green[300],
        disabledTextColor: Colors.green[300],
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        highlightedBorderColor: Colors.green[300],
        highlightColor: Colors.green[100],
      ),
    );
  }
}
