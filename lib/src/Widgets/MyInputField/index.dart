import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final String placeHolder, label;
  final TextInputType keyboardType;

  final IconData icon;
  final Function onChangeText;

  MyInputField({
    this.placeHolder,
    this.label,
    this.icon,
    this.onChangeText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
          style: TextStyle(
            fontFamily: 'PTSans', 
          ),
        onChanged: (String value) {
          onChangeText(value);
        },
        keyboardType: this.keyboardType,
        decoration: InputDecoration(
          
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.green[300]),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.green[300]),
          ),
          
          // errorText: 'ohh',
          hintText: placeHolder,
          hintStyle: TextStyle(fontFamily: 'PTSans'),
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.green[300],
            fontFamily: 'PTSans'
          ),
          prefixIcon: Icon(
            icon,
            size: 20,
            color: Colors.green[300],
          ),
          contentPadding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
