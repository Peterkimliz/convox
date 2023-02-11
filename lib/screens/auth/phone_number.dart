import 'package:convox/controllers/authController.dart';
import 'package:convox/utils/styles.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'otp_page.dart';

class PhoneNumber extends StatelessWidget {
  PhoneNumber({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Styles().appBarColor,
            centerTitle: true,
            title: Row(
              children: [
                Spacer(),
                Text(
                  "Phone Number",
                  style: TextStyle(color: Styles().textColor, fontSize: 16),
                ),
                Spacer(),
                Obx(() => InkWell(
                      onTap: authController.isEnabled.value
                          ? () => Get.to(() => OtpPage())
                          : () {},
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: authController.isEnabled.value
                                ? Styles().textColor
                                : Styles().doneColor,
                            fontSize: 16),
                      ),
                    ))
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Please confirm your country code and\n enter your phone number ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Styles().textColor),
              )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    countryListTheme: CountryListThemeData(
                      flagSize: 25,
                      backgroundColor: Colors.white,
                      textStyle:
                          TextStyle(fontSize: 16, color: Colors.blueGrey),
                      bottomSheetHeight: 500,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      //Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                    onSelect: (Country country) {
                      authController.selectedCountry.value = country;
                      print(country.displayNameNoCountryCode);
                      print('Select country: ${country.displayName}');
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              authController.selectedCountry.value == null
                                  ? "Select Country"
                                  : "${authController.selectedCountry.value!.name}",
                              style: TextStyle(
                                  color: Styles().seelectedCountryName,
                                  fontSize: 17),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      Divider()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IntrinsicHeight(
                              child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(authController.selectedCountry.value == null
                                  ? ""
                                  : "+${authController.selectedCountry.value!.phoneCode}"),
                              VerticalDivider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                          Expanded(
                            child: TextFormField(
                              controller:
                                  authController.textEditingControllerPhone,
                              onChanged: (value) {
                                if (value.toString().length < 10 ||
                                    authController.selectedCountry.value ==
                                        null) {
                                  authController.isEnabled.value = false;
                                } else {
                                  authController.isEnabled.value = true;
                                }
                              },
                              keyboardType: TextInputType.number,
                              scrollPadding: EdgeInsets.all(0),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(15),
                              ],
                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.all(0.0),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                isDense: true,
                                hintText: 'Phone Number',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
