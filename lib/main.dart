import 'package:flutter/material.dart';

import './src/Screens/HomeScreen/index.dart';
import './src/Widgets/MyBottomSheet/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Expense Planner'),
          ),
          body: HomeScreen(),
          floatingActionButton: MyBottomSheet(),
        ));
  }
}
