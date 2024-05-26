




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFormField extends StatelessWidget{

  final String formName;
  final String formHints;
  final TextInputType inputType;
  final TextEditingController textEditingController;

  const InputFormField({super.key, required this.formName, required this.formHints, required this.inputType, required this.textEditingController});

  //const FormField({super.key, required this.formName, required this.formHints, required this.inputType, required this.textEditingController});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Text('$formName:',style:GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),),



          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
            ),
            height: 40,
            width: Get.width*0.5,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              keyboardType: inputType,
              textAlign: TextAlign.end,
              cursorColor: Colors.white,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
              controller: textEditingController,
              decoration: InputDecoration(

                hintStyle: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade100
                ),
                border: InputBorder.none,
                hintText: formHints,

              ),
            ),
          )

        ],
      ),
    );
  }

}