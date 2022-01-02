import 'package:flutter/material.dart';

import 'itemwidget.dart';


class ScreenHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANIMATIONS'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children:  [
MaterialButton(
    minWidth: 300.0,
    height: 40.0,
    onPressed: () {
      Navigator.push(
        context,
         MaterialPageRoute
         (builder: (context) => SecondRoute(
          )
         )
         );
         },
    color: Colors.lightBlue,
    child: const Text('ir ala primera animacion',
     style: TextStyle(color: Colors.white)),
  ),
          ],
        ),
      ),
    );
  }
}