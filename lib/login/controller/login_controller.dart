




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../routes/app_pages.dart';
import '../../util/app_local_stroge.dart';




class LoginController extends GetxController{


  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();




  Future<void> doLogin(
      String name,
      String email,
      String password,
      ) async {
    Map<String, String> userData = Map();
    userData['email'] = email;
    userData['username'] = name;
    userData['password'] = password;


    debugPrint("userData" + userData.toString());


    final url = Uri.parse('https://techtest.youapp.ai/api/login');

    var response = await http.post(
      url,
      body: userData,
    );

    debugPrint(
        "Response Code..................." + response.statusCode.toString());

    if (response.statusCode == 201||response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if(jsonResponse['access_token']!=null){

      await getStorage.write('token', jsonResponse['access_token']);
      debugPrint("Response body..................." + jsonResponse.toString());
      Get.toNamed(Routes.HOME);
      Get.snackbar('Success', '${jsonResponse['message']}', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
      //Get.snackbar('Success', '${getStorage.read('token')}', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);

      }
    } else {

    }
  }




}