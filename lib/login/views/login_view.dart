




import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app/components/password_field_component.dart';

import '../../components/text_field_component.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController>{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Icon(Icons.arrow_back_ios,color: Colors.white,),
                Text('Back',style:GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),)
              ],
            ),


            SizedBox(height: 60,),


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



            Container(
              alignment: Alignment.center,
              width: Get.width,
              height: 48,
              child: Text('Login',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),
              ),

              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(10)
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
                Text('Register here',style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.amber.shade600
                ),),
              ],
            )



          ],
        ),
      ),
    );
  }
  
}