




import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app/components/colors.dart';
import 'package:you_app/components/password_field_component.dart';
import 'package:you_app/routes/app_pages.dart';

import '../../components/text_field_component.dart';
import '../controller/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController>{
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      // backgroundColor: Colors.teal,
      // appBar: AppBar(backgroundColor: Colors.transparent,
      // automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: loginDecoration,
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 70,),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios,color: Colors.white,),
                      Text('Back',style:GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),)
                    ],
                  ),
                ),


                SizedBox(height: 60,),


                Text('Register',style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),),

                SizedBox(height: 25,),


                TextfieldComponents(textEditingController: controller.emailController, hints: 'Enter Email'),
                SizedBox(height: 11,),
                TextfieldComponents(textEditingController: controller.nameController, hints: 'Create Username'),
                SizedBox(height: 11,),
                PasswordfieldComponents(textEditingController: controller.passwordController, hints: 'Create Password'),
                SizedBox(height: 11,),
                PasswordfieldComponents(textEditingController: controller.confirmPasswordController, hints: 'Confirm Password'),

                const SizedBox(height: 20,),

                InkWell(
                  onTap: (){

                    controller.doRegistration(controller.nameController.text, controller.emailController.text, controller.passwordController.text);
                    //Get.toNamed(Routes.HOME);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: 48,
                    decoration: BoxDecoration(
                        //color: Colors.teal.shade300,
                        borderRadius: BorderRadius.circular(10),
                      gradient: buttonDisableGradiant
                    ),
                    child: Text('Register',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have an account? ',style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Text('Login here',style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber.shade600
                      ),),
                    ),
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
  
}