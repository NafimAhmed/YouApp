




import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomeController extends GetxController{


 TextEditingController displayNameController=TextEditingController();
 TextEditingController birthDayController=TextEditingController();
 TextEditingController horscopeController=TextEditingController();
 TextEditingController zodiacController=TextEditingController();
 TextEditingController heightController=TextEditingController();
 TextEditingController weightController=TextEditingController();

  RxString userName='@johndoe123'.obs;
  RxBool aboutDetail=false.obs;


}