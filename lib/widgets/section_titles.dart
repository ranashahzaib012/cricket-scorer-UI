import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget{
  final String title;
  const SectionTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: Colors.green,
        fontSize: 18
      ),


    );
  }


}