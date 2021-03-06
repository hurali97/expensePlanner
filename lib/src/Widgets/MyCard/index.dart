import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String _date, _amount, _title, _id;
  final Function removeHandler;

  MyCard(this._title, this._date, this._amount, this._id, this.removeHandler);

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
                children: [
                  Text(this._title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                        fontFamily: 'PTSans',
                      )),
                  Text(
                    this._date,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                      fontFamily: 'PTSans',
                    ),
                  ),
                ],
              ),
              subtitle: Container(
                child: Text(
                  "You made a transaction of \$${this._amount} in total.",
                  style: TextStyle( 
                    fontFamily: 'PTSans',
                  ),
                ),
                margin: EdgeInsets.only(top: 4),
              )),
          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 0.5,
            child: IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () => removeHandler(_id),
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
