import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controllers/authentication_controllers.dart';
import 'widgets/centred_row.dart';

var formKey = GlobalKey<FormState>();

bool isChecked = false;
bool isVisible = false;

extension EmailValidation on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

class SigninScreen extends StatefulWidget {
  
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
 authenticationController signin_controller = Get.find<authenticationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: GetBuilder<authenticationController>(
              builder:(signin_controller)=> SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                              //Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 16,
                              color: Colors.grey,
                            )),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Multi",
                          ),
                        ),
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Sign in with your email and password \nor continue with social media',
                      style: TextStyle(
                        color: Colors.grey,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      
                      validator: (String? value) {
                        return signin_controller.check_email(value!);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        labelText: "Email",
                        hintText: "Enter your email",
                        suffixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: !isVisible,
                      validator: (String? value) {
                        return signin_controller.check_password(value!);
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 25),
                        labelText: "Password",
                        hintText: "Enter your password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Checkbox(
                            //   value: isChecked,
                            //   onChanged: changeCheckboxState,
                            // ),
                            StatefulCheckBox(),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    TextButton(
                      onPressed: () => signin_controller.Continue_to_home(context,formKey),
                      child: Text('Continue'),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xfff77546),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 130,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          // padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffeeeff1),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            "assets/icons/google.svg",
                            width: 25,
                            height: 25,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffeeeff1),
                          ),
                          child: Image.asset("assets/icons/facebook.png"),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffeeeff1),
                          ),
                          child: Image.asset("assets/icons/twitter.png"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    CentredRow(
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  

  void changeCheckboxState(bool? value) {
    print('changeCheckboxState: $value');
    isChecked = value!;
  }
}

class StatefulCheckBox extends StatefulWidget {
  const StatefulCheckBox({super.key});

  @override
  State<StatefulCheckBox> createState() => _StatefulCheckBoxState();
}

class _StatefulCheckBoxState extends State<StatefulCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: changeCheckboxState,
    );
  }

  void changeCheckboxState(bool? value) {
    isChecked = value!;
    setState(() {});
    
  }
}