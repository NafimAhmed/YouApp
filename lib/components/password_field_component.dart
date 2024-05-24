






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordfieldComponents extends StatelessWidget{

  final TextEditingController textEditingController;
  final String hints;
  RxBool isSeen=true.obs;

   PasswordfieldComponents({super.key, required this.textEditingController, required this.hints});




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
      child: Obx(() => TextField(

        obscureText: isSeen.value,
        controller: textEditingController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '${hints}',
            suffixIcon: InkWell(
              onTap: (){

                if(isSeen.value==true){
                  isSeen.value=false;
                }else{
                  isSeen.value=true;
                }

              },
                child: Icon(
                  isSeen==true?
                    Icons.visibility_off:
                  Icons.visibility
                )
            )
        ),
      ),),



    );
  }

}