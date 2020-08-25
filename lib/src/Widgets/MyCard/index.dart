import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String _date, _amount, _title;

  MyCard(this._title, this._date, this._amount);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              size: 40,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
                Text(this._title, style: TextStyle(fontSize: 18,color: Colors.grey[700])),
                Text(this._date, style: TextStyle(fontSize: 10,color: Colors.grey[600]), ),
              ],
              
            ),
            subtitle:
                Container(
                  child: Text("You made a transaction of \$${this._amount} in total."),
                  margin: EdgeInsets.only(top: 4),
                )
          ),
          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 0.5,
            child: IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: null,
              tooltip: 'Delete transaction',
              splashColor: Colors.lime,
              enableFeedback: true,
            ),
          ),
        ],
      ),
      color: Colors.lightGreen[300],
    );
  }
}
