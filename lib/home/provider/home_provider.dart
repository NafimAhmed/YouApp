




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




  Future<ProfileModel> UpdateUserData() async {


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







}


