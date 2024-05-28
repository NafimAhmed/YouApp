




import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:you_app/home/provider/home_provider.dart';
import 'package:you_app/util/app_local_stroge.dart';

import '../models/profile_model.dart';



class HomeController extends GetxController{


 TextEditingController displayNameController=TextEditingController();
 TextEditingController birthDayController=TextEditingController();
 TextEditingController horscopeController=TextEditingController();
 TextEditingController zodiacController=TextEditingController();
 TextEditingController heightController=TextEditingController();
 TextEditingController weightController=TextEditingController();


  RxBool aboutDetail=false.obs;

  RxBool isdataLoading=true.obs;

  var userProfileModel=ProfileModel().obs;


 Future<void> getProfile() async {


  try {
   await HomeProvider().fetchUserData().then((result) async {

    userProfileModel.value = result;
    isdataLoading.value=false;

    Get.snackbar('Success', 'user Name = ${userProfileModel.value.data?.username}', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    displayNameController.text='${userProfileModel.value.data?.username}';


   }).catchError((error) {
    isdataLoading.value = true;
    debugPrint("getCustomerIncomeDetails catchError $error");

   });
  } on HttpException {
   debugPrint("getCustomerIncomeDetails catchError http");

  } finally {
   isdataLoading.value =  true;
  }

 }



 @override
  void onClose() {
//
  }

  @override
  void onReady() {
//
  }

  @override
  Future<void> onInit() async {
  await getProfile();
//
  }
}