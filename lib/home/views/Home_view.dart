




import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app/components/colors.dart';
import 'package:you_app/components/form_field.dart';
// import 'package:you_app/components/password_field_component.dart';
import 'package:you_app/home/views/interest_input_page.dart';

// import '../../components/text_field_component.dart';
// import '../../routes/app_pages.dart';
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
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Row(children: [
                Icon(Icons.arrow_back_ios,size: 14,color: Colors.white,),
                Text('Back',style:GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),)
              ],),
            ),
            SizedBox(width: Get.width/6,),


            Obx(() =>  Text('${controller.userProfileModel.value.data?.username}',style:GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),

            ),),









            
            
            
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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

                  Obx(() => Text('${controller.userProfileModel.value.data?.username}',style:GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),),),



                  Obx(() => controller.userProfileModel.value.data?.horoscope!=null && controller.userProfileModel.value.data?.zodiac!=null?


                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black
                        ),
                        child: Text(controller.userProfileModel.value.data?.horoscope??'',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 30,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black
                        ),
                        child: Text(controller.userProfileModel.value.data?.zodiac??'',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),),
                      )
                    ],
                  ):Container(height: 0,width: 0,)

                  ),





                ],
              ),
            ),


            Obx(() => controller.aboutDetail.value!=true?
            Container(


              width: Get.width,
              //height: 120,
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

                      InkWell(
                          onTap: (){
                            controller.aboutDetail.value=true;
                          },

                          child: Icon(Icons.border_color_outlined,color: Colors.white,size: 20,))

                    ],
                  ),



                  Obx(() => controller.userProfileModel.value.data?.birthday==null &&
                      controller.userProfileModel.value.data?.horoscope==null &&
                      controller.userProfileModel.value.data?.zodiac==null &&
                      controller.userProfileModel.value.data?.height==null && controller.userProfileModel.value.data?.weight==null?

                  Text('Add in your your to help others know you better',style:GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400
                  ),):Container(height: 0,width: 0,),),


                  Obx(() => controller.userProfileModel.value.data?.birthday!=null?Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text('Birthday:',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400
                        ),),
                        Text(' ${controller.userProfileModel.value.data?.birthday}',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ):Container(height: 0,width: 0,)),



                  Obx(() => controller.userProfileModel.value.data?.horoscope!=null?
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text('Horoscope:',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400
                        ),),
                        Text(' ${controller.userProfileModel.value.data?.horoscope}',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ):Container(height: 0,width: 0,)),

                  Obx(() => controller.userProfileModel.value.data?.zodiac!=null?
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text('Zodiac:',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400
                        ),),
                        Text(' ${controller.userProfileModel.value.data?.zodiac}',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ):Container(height: 0,width: 0,)),



                  Obx(() => controller.userProfileModel.value.data?.height!=null?
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text('Height:',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400
                        ),),
                        Text(' ${controller.userProfileModel.value.data?.height}',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ):Container(height: 0,width: 0,)),


                  Obx(() => controller.userProfileModel.value.data?.weight!=null?
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text('Weight:',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400
                        ),),
                        Text(' ${controller.userProfileModel.value.data?.weight}',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ):Container(height: 0,width: 0,)),




                ],
              ),
            ):
            Container(


              width: Get.width,
              // height: 120,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 21),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(.4)
              ),
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('About',style:GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),

                      ),

                      // Icon(Icons.border_color_outlined,color: Colors.white,size: 20,)

                      InkWell(
                        onTap: (){

                          // Get.snackbar('Success', 'Save pressed', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
                          // controller.aboutDetail.value=false;
                          controller.updateProfile();
                          controller.aboutDetail.value=false;
                        },
                        child: Text('Save & Update',style:GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber
                        ),),
                      )

                    ],
                  ),


                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: (){
                              controller.getImageData();
                            },
                            child: Icon(Icons.add_box,size: 50,color: Colors.grey,)),

                        Text('Add image',style:GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),)
                      ],
                    ),
                  ),



                  // SizedBox(height: 20,),

                  InputFormField(formName: 'Display name', formHints: 'Enter name', inputType: TextInputType.text, textEditingController: controller.displayNameController),
                  InputFormField(formName: 'Birthday', formHints: 'DD MM YYYY', inputType: TextInputType.datetime, textEditingController: controller.birthDayController),
                  InputFormField(formName: 'Horoscope', formHints: '--', inputType: TextInputType.text, textEditingController: controller.horscopeController),
                  InputFormField(formName: 'Zodiac', formHints: '--', inputType: TextInputType.text, textEditingController: controller.zodiacController),
                  InputFormField(formName: 'Height', formHints: 'Add height', inputType: TextInputType.number, textEditingController: controller.heightController),
                  InputFormField(formName: 'Weight', formHints: 'Add weight', inputType: TextInputType.number, textEditingController: controller.weightController),

                  // Text('Add in your your to help others know you better',style:GoogleFonts.inter(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w500,
                  //     color: Colors.grey.shade400
                  // ),),

                ],
              ),
            )),






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
                          //Get.toNamed(Routes.INTEREST_PAGE);
                          Get.to(InterestInputPage());
                        },
                        child: Icon(Icons.border_color_outlined,color: Colors.white,size: 20,),
                      )

                    ],
                  ),





                  Obx(
                          () => controller.userProfileModel.value.data?.interests?.length==0?Text('Add in your interest to find a better match',style:GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400
                      ),):
                      Wrap(
                        spacing: 4.0,
                        children: controller.userProfileModel.value.data?.interests?.isNotEmpty==true?


                        controller.userProfileModel.value.data!.interests!.map((friendModel) => Chip(
                            backgroundColor: Colors.grey.withOpacity(0.4),

                            label: Text(friendModel))).toList():[],



                      )
                  ),
                ],
              ),
            )


          ],
        ),
      )//Obx(() => controller.isdataLoading.value==true? Center(child: CircularProgressIndicator()):)

      ,
    );
  }
  
}