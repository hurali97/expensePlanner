import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressHandler; 

  MyButton(this.onPressHandler);

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: MediaQuery.of(context).size.width * 0.8, 
      margin: EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        child: Text('Add'), 
        disabledColor:  Colors.green[600],
        color: Colors.green[600],
        onPressed: onPressHandler, 
        padding: EdgeInsets.all(15), 
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0)), 
        highlightColor: Colors.green[100],
        splashColor: Colors.grey[600],
        disabledElevation: 5, 
      ),
    );
  }
}
