import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
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
            title: Text('Monday'),
            subtitle: Text("You made a transaction of \$40 in total."),
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
