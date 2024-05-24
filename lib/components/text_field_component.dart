






// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldComponents extends StatelessWidget{

  final TextEditingController textEditingController;
  final String hints;

  const TextfieldComponents({super.key, required this.textEditingController, required this.hints});




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: 51,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.7)
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            hintStyle: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade100
            ),
            border: InputBorder.none,
            hintText: hints
        ),
      ),
    );
  }

}