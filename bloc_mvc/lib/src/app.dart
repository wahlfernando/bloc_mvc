import 'package:bloc_mvc/src/ui/move_list.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: MoveList(),
        ),
      ),
    );
  }
}
