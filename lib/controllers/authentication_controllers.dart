import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
class authenticationController extends GetxController{
  bool is_email_valid=false;
  bool is_password_valid=false;
  bool is_passwords_matching=false;
  bool confirmed=false;
  String? password;
  String? email;
  String? password_confirmation;
  /*@override
  void initState() {
    bool is_email_valid=false;
    bool is_password_valid=false;
    bool confirmed=false;
    
  }*/
   @override
  void initState() {
     bool is_email_valid=false;
  bool is_password_valid=false;
  bool is_passwords_matching=false;
  bool confirmed=false;
    
  }
  String? check_matching_passwords(String input_password_confirmation)
  {
    password_confirmation=input_password_confirmation;
    if (password_confirmation==password){return null;}
    else {
      if(input_password_confirmation.length==0)
      {return "Password Confirmation Required";}
      else
      {return "Password not matching";}}
  }
  String? check_email(String input_email)
  { email=input_email;
    is_email_valid=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input_email);
    if(!is_email_valid){return "Email not valid";}
    else {return null;}
      
  }
  
  String? check_password(String input_password)
  {
    //counting number of letters and alphabet and spaces and special characters to see what to return from the function
    int letterCount = 0;
    int digitCount = 0;
    int specialCharCount = 0;
    int spaceCount=0;
    password = input_password;
    if(input_password.length==0){return "Password Required DARORI";}
    else if(input_password.length<8 || input_password.length>20){return "Must contain 8-20 characters";}
    else{
      //calculate letters
    for (var match in RegExp(r'[a-zA-Z]').allMatches(input_password)) {
    letterCount++;
    }
      //calculate digits
    for (var match in RegExp(r'\d').allMatches(input_password)) {
    digitCount++;
    }
      //calculate special characters
    for (var match in RegExp(r'[^a-zA-Z\d]').allMatches(input_password)) {
    specialCharCount++;
    }
      //calculate spaces
    for (var match in RegExp(r'\s').allMatches(input_password)) {
    spaceCount++;
    } 
    specialCharCount=specialCharCount-spaceCount;
    //excluding spaces from special chars
    
    if(letterCount*digitCount*specialCharCount==0){
      if (spaceCount==input_password.length) return "Password can't be all spaces";
      else if(letterCount==0) return "Must contain at least 1 character";
      else if(digitCount==0) return "Must contain at least 1 digit";
      else if(specialCharCount==0) return "Must contain at least 1 special character";
    }
    else
    { 
      is_password_valid=true;
      return null;
    }
    
      }
  }
  void Continue_to_home(context,var formKey) {
    
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.toNamed("/home");
      
      /*debugPrint(email);
      debugPrint(password);
      debugPrint(isChecked.toString());*/
      // call sign in API
      // if success
      // go to home screen
      
    }
  }
  
}