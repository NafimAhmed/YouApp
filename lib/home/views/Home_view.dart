




import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app/components/colors.dart';
import 'package:you_app/components/password_field_component.dart';

import '../../components/text_field_component.dart';
import '../../routes/app_pages.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController>{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HOME_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.arrow_back_ios,size: 14,color: Colors.white,),
              Text('Back',style:GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),)
            ],),
            SizedBox(width: Get.width/6,),
            Text('@johndoe123',style:GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),),







            
            
            
          ],
        ),
      ),
      body: Column(
        children: [


          Container(
            width: Get.width,
            height: 190,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(.7)
            ),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${controller.userName}',style:GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),)
              ],
            ),
          ),



          Container(


            width: Get.width,
            height: 120,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 21),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(.4)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('About',style:GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),),
                    
                    Icon(Icons.border_color_outlined,color: Colors.white,size: 20,)
                    
                  ],
                ),


                Text('Add in your your to help others know you better',style:GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400
                ),),

              ],
            ),
          ),






          Container(
            width: Get.width,
            height: 109,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(.4)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Interest',style:GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),),

                    InkWell(
                      onTap: (){
                        Get.toNamed(Routes.INTEREST_PAGE);
                      },
                        child: Icon(Icons.border_color_outlined,color: Colors.white,size: 20,),
                    )

                  ],
                ),


                Text('AAdd in your interest to find a better match',style:GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400
                ),),

              ],
            ),
          )



        ],
      ),
    );
  }
  
}