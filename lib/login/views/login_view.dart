




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app/components/password_field_component.dart';

import '../../components/colors.dart';
import '../../components/text_field_component.dart';
import '../../routes/app_pages.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController>{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // backgroundColor: Colors.teal,
       //appBar: AppBar(title: Container(color: Colors.transparent,),),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          decoration: loginDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 70,),

                InkWell(
                  onTap: (){
                    SystemNavigator.pop();
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


                const SizedBox(height: 60,),


                Text('Login',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),



                const SizedBox(height: 10,),
                TextfieldComponents(textEditingController: controller.emailController, hints: 'Enter Username/Email',),


                const SizedBox(height: 20,),

                PasswordfieldComponents(textEditingController: controller.passwordController, hints: 'Enter Password'),


                const SizedBox(height: 20,),



                InkWell(
                  onTap: (){
                    controller.doLogin(controller.emailController.text, controller.emailController.text, controller.passwordController.text);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: 48,
                    decoration: BoxDecoration(
                      // color: Colors.teal.shade300,
                      borderRadius: BorderRadius.circular(10),
                        gradient: buttonDisableGradiant
                    ),
                    child: Text('Login',
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
                    Text('No account? ',style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),),
                    InkWell(
                      onTap: (){
                        Get.toNamed(Routes.REGISTRATION);
                      },
                      child: Text('Register here',style: GoogleFonts.inter(
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