import 'package:convox/controllers/authController.dart';
import 'package:convox/screens/home/memos.dart';
import 'package:convox/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Styles().appBarColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Styles().seelectedCountryName,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Enter OTP Code",
          style: TextStyle(color: Styles().textColor, fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 39,
              ),
              Center(
                child: Text(
                  "Code has been sent to +${authController.selectedCountry.value!.phoneCode} ${authController.textEditingControllerPhone.text.trim()}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Styles().textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 42,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  focusBorderColor: Colors.transparent,
                  borderColor: Colors.transparent,
                ),
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Resend code in',
                      style: TextStyle(color: Styles().textColor, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' 55s',
                            style: TextStyle(
                                color: Styles().seelectedCountryName,
                                fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              })
                      ]),
                ),
              ),
              SizedBox(
                height: 265,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(() => MemosPage());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Styles().seelectedCountryName,
                      borderRadius: BorderRadius.circular(168),
                    ),
                    child: Center(
                      child: Text(
                        "Continue".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
