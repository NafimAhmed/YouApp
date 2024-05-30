




import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app/home/models/profile_model.dart';
import 'package:http/http.dart' as http;

import '../../util/app_local_stroge.dart';

class HomeProvider extends GetConnect{




  Future<ProfileModel> fetchUserData() async {


    final url = Uri.parse('https://techtest.youapp.ai/api/getProfile');

    var response = await http.get(
        url,
        headers: {
          'x-access-token': '${getStorage.read('token')}'
        }
    );

    debugPrint(""+response.statusCode.toString());


    if (response.statusCode == 200) {
      debugPrint(response.body);
      return profileModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }




  Future<ProfileModel> UpdateUserData(String name,String birthday,String height,String weight, List<String> interest) async {


    Map<String, dynamic> userData = Map();
    userData['name'] = name;
    userData['birthday'] = birthday;
    userData['height'] = 0;
    userData['weight'] = 0;
    userData['interests'] = ['music'];

    Get.snackbar('Success', 'update user fuction called', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);


    final url = Uri.parse('https://techtest.youapp.ai/api/updateProfile');

    final msg = jsonEncode(userData);
    var response = await http.put(
        url,
        headers: <String,String>{

          'accept': '*/*' ,
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTRjODZmMzViMDQ0YTUxM2ZjOTNkYSIsInVzZXJuYW1lIjoiTmFmaW0gQWhtZWQiLCJlbWFpbCI6InJhd0BnbWFpbC5jb20iLCJpYXQiOjE3MTcwNjE4MzYsImV4cCI6MTcxNzA2NTQzNn0.hoH6eTjXhHKyUOK8aOmsTHwG-JLL6kAcqsYCk4R_N3A',
          'Content-Type':'application/json',
        },
      body: msg//jsonEncode(userData)//userData
    );

    debugPrint(""+response.statusCode.toString());

    Get.snackbar('Success', 'update user API Call Status code ${response.statusCode}', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);


    if (response.statusCode == 200) {
      debugPrint(response.body);
      return profileModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }







}


