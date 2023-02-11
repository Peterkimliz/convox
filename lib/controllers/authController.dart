import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  Rxn<Country> selectedCountry=Rxn(null);
  RxBool isEnabled=RxBool(false);
  TextEditingController textEditingControllerPhone=TextEditingController();
}