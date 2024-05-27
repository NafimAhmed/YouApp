import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> doRegistration(
    String name,
    String email,
    String password,
  ) async {
    Map<String, String> userData = Map();
    userData['email'] = email;
    userData['username'] = name;
    userData['password'] = password;
    debugPrint("userData" + userData.toString());
    final url = Uri.parse('https://techtest.youapp.ai/api/register');

    var response = await http.post(
      url,
      body: userData,
    );

    debugPrint(
        "Response Code..................." + response.statusCode.toString());

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);

      debugPrint("Response body..................." + jsonResponse.toString());

      Get.back();

      Get.snackbar('Success', '${jsonResponse['message']}',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } else {
      Get.snackbar('Failed', 'Registration Failed',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.amber);
    }
  }
}
