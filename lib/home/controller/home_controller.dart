




// import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
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


 List<String> interestSelectionList = <String>[];
 RxBool profilepicLoader=false.obs;


  RxBool aboutDetail=false.obs;

  RxBool isdataLoading=true.obs;

  var userProfileModel=ProfileModel().obs;


 Future<void> getProfile() async {


  try {
   await HomeProvider().fetchUserData().then((result) async {

    userProfileModel.value = result;

    isdataLoading.value=false;
    // Get.snackbar('Success', 'user Name = ${userProfileModel.value.data?.username}', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    displayNameController.text='${userProfileModel.value.data?.username??''}';
    birthDayController.text='${userProfileModel.value.data?.birthday??''}';
    horscopeController.text='${userProfileModel.value.data?.horoscope??''}';
    zodiacController.text='${userProfileModel.value.data?.zodiac??''}';
    heightController.text='${userProfileModel.value.data?.height??''}';
    weightController.text='${userProfileModel.value.data?.weight??''}';



   }).catchError((error) {
    isdataLoading.value = true;
    debugPrint("getCustomerIncomeDetails catchError $error");

   });
  } on HttpException {
   debugPrint("getCustomerIncomeDetails catchError http");

  } finally {
   isdataLoading.value =  false;
  }

 }





 Future<void> updateProfile() async {

  // Get.snackbar('Success', 'update fuction called', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);

  try {
   await HomeProvider().UpdateUserData(displayNameController.text,birthDayController.text,double.parse(heightController.text),double.parse(weightController.text),interestSelectionList).then((result) async {

    userProfileModel.value = result;
    userProfileModel.refresh();
    isdataLoading.value=false;
    aboutDetail.value=false;



    // Get.snackbar('Success', 'user Name = ${userProfileModel.value.data?.username}', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    displayNameController.text='${userProfileModel.value.data?.username}';


   }).catchError((error) {
    isdataLoading.value = true;
    // Get.snackbar('Failed', '${error}', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.blue);


   });
  } on HttpException {
   debugPrint("getCustomerIncomeDetails catchError http");

  } finally {
   isdataLoading.value =  true;
  }

 }


 Future<void> getImageData() async {
  final XFile? response = (await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 5));
  if (response != null) {

   profilepicLoader.value = true;

   String imgPath = await HomeProvider().imageUpload(response.path, File(response.path));
   //profilePicURL.value ='$IMAGE_BASE_URL$imgPath';
   await getStorage.write("profile_picture", "$imgPath");


   profilepicLoader.value = false;


  } else {
   return null;
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