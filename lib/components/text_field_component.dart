






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfieldComponents extends StatelessWidget{

  final TextEditingController textEditingController;
  final String hints;

  const TextfieldComponents({super.key, required this.textEditingController, required this.hints});




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: 51,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.7)
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '${hints}'
        ),
      ),
    );
  }

}