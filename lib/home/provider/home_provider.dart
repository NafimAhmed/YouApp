




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




  Future<ProfileModel> UpdateUserData(String name,String birthday,double height,double weight, List<String> interest) async {


    Map<String, dynamic> userData = Map();
    userData['name'] = name;
    userData['birthday'] = birthday;
    userData['height'] = height;
    userData['weight'] = weight;
    userData['interests'] = interest;

    Get.snackbar('Success', 'update user fuction called', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);


    final url = Uri.parse('https://techtest.youapp.ai/api/updateProfile');

    final msg = jsonEncode(userData);
    var response = await http.put(
        url,
        headers: <String,String>{

         // 'accept': '*/*' ,
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTRjODZmMzViMDQ0YTUxM2ZjOTNkYSIsInVzZXJuYW1lIjoiTmFmaW0gQWhtZWQiLCJlbWFpbCI6InJhd0BnbWFpbC5jb20iLCJpYXQiOjE3MTcwNjE4MzYsImV4cCI6MTcxNzA2NTQzNn0.hoH6eTjXhHKyUOK8aOmsTHwG-JLL6kAcqsYCk4R_N3A',
          //'Content-Type':'application/json',
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



  Future<String> imageUpload(String file_path, File? image_file) async {
    FormData userData = FormData({

      'profile_pic': image_file == null
          ? null
          : MultipartFile(image_file,
          filename: DateTime.now().toString() + file_path),
    });
    debugPrint('File Pathe from proider---------------------------$file_path');



    debugPrint('File Pathe ---------------------------$file_path');



    final url = '';



    Map<String, String> headers = {
      "Authorization": "Bearer ${getStorage.read('token')}",
    };

    var response = await post(url, userData,headers: headers);




    debugPrint("ressssssssssssssssssssssssssss${response.statusCode}");
    debugPrint("ressssssssssssssssssssssssssss${response.body}");

    if (response.statusCode == 200) {



      debugPrint('get storage end ----------------------------------------${getStorage.read("profile_picture")}');



      return '${response.body['data']["path"]}';



    } else {

      await getStorage.write('loginStatus',false);
      debugPrint("status from login ......"+getStorage.read('loginStatus').toString());
      return "";
    }
  }







}


