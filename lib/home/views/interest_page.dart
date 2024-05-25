





import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app/components/colors.dart';
import 'package:you_app/home/controller/home_controller.dart';

class InterestPage extends GetView<HomeController>{
  const InterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: GRADIENT2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(Icons.arrow_back_ios,size: 14,color: Colors.white,),
              Text('Back',style:GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),)
            ],),

            Text('Save',style:GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlueAccent
            ),),










          ],
        ),
      ),
    );
  }
  
}