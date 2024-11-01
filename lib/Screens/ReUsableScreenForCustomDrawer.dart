import 'package:flutter/material.dart';
class ReUsabelScreenForCustomDrawer extends StatelessWidget {
  final String label;
  final String StringData;
  const ReUsabelScreenForCustomDrawer({super.key, required this.label,required this.StringData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label,style: const TextStyle(fontSize: 24,fontWeight:FontWeight.bold,color: Colors.white),),backgroundColor:Colors.blue,elevation: 5.0,),
      body: Center(child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(StringData,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),))),
    );
  }
}