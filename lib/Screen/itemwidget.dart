import 'dart:math';

import 'package:animations/Screen/colors.dart';
import 'package:flutter/material.dart';


class SecondRoute extends StatefulWidget {
  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {


List<String> _getvalues() => List.generate(20, (index) => 'Item $index');

List<Widget> _valuesWidgets() => _getvalues().map((e) => MyWidegt(value: e, transValue: 0.0,colorRandom: Colors.red,)).toList();
final PageController _scroll = new PageController();
double _DoubleSroll = 0.0;

void _getpage()
{
setState(() {
_DoubleSroll = _scroll.page!;
});
}
@override
void initState() {
  super.initState();
  _scroll.addListener(_getpage);
  //_valuesWidgets();
  //_getvalues();
}

  @override
  Widget build(BuildContext context) {
    final values = _getvalues();
    return  Scaffold(
appBar: AppBar(title: const  Text('ANIMATIONS'),),
    body: PageView.builder(
      itemCount: finalcolors.length,
    controller: _scroll,
      scrollDirection: Axis.horizontal,
      itemBuilder: ( context,  index) {
   final current = (_DoubleSroll - index);
   final _current = index;
      final colorUpdate = finalcolors;
  
   
   final fvalue = current.clamp(0.0, 1.0);
print(_current);
   print('1 $current');
   print('2 $fvalue');
   print('index $index');
        return  MyWidegt(value: values[index],
        transValue: fvalue,
        colorRandom: colorUpdate[index]);  
      }
    ),    
      
    );
  }
}

class MyWidegt extends StatelessWidget {
  final List<Color> _getcolors = [Colors.blue, Colors.red, Colors.blue];
final   colorRandom;

final String value;
final double transValue;
   MyWidegt({Key? key, required this.value, required this.transValue, required this.colorRandom}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
       
          child: Transform(
            alignment: Alignment.center,
            transform: 
            Matrix4.identity()..setEntry(3, 2, 0.002)..setRotationX(pi * transValue),
        child: Opacity(
          opacity: 1- transValue,
          child: Container(
          
          color: colorRandom,
          child: 
          Center(child: Text(value, style: const TextStyle(color: Colors.white))),
          ),
        ),
        //const Image(image: 
        //NetworkImage('https://www.mundoperro.net/wp-content/uploads/razas-perros-guia.jpg'),
        //fit: BoxFit.cover
        //),
            
          ),
       
      ),
    );
  }
}