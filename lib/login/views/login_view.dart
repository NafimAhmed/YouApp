




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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            
            PasswordfieldComponents(textEditingController: controller.passwordController, hints: 'Enter Password')





          ],
        ),
      ),
    );
  }
  
}