import '../constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_dialogs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenumController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void register() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        mobilenumController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      customDialog(context, title: 'Error', content: 'All fields are required');
      return;
    }

    if (mobilenumController.text.length != 11 ||
        !RegExp(r'^[0-9]+$').hasMatch(mobilenumController.text)) {
      customDialog(
        context,
        title: 'Error',
        content: 'Enter a valid 11-digit mobile number',
      );
      return;
    }

    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    if (!passwordRegex.hasMatch(passwordController.text)) {
      customDialog(
        context,
        title: 'Error',
        content:
            'Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character.',
      );
      return;
    }

    if (passwordController.text != confirmpasswordController.text) {
      customDialog(context, title: 'Error', content: 'Passwords do not match');
      print(passwordController.text);
      print(confirmpasswordController.text);
      return;
    }

    // If all validations pass
    customDialog(
      context,
      title: 'Success',
      content: 'Registration successful!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FB_DARK_PRIMARY,
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          color: FB_DARK_PRIMARY,
          padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(40),
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(10),
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(25)),
              CustomFont(
                text: 'Register Here',
                fontSize: ScreenUtil().setSp(50),
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              SizedBox(height: ScreenUtil().setHeight(25)),
              CustomTextformfield(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: Colors.grey,
                hintText: 'First Name',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: firstnameController,
                fillColor: FB_LIGHT_PRIMARY,
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomTextformfield(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: Colors.grey,
                hintText: 'Last Name',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: lastnameController,
                fillColor: FB_LIGHT_PRIMARY,
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomTextformfield(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: Colors.grey,
                hintText: 'Mobile Number',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: mobilenumController,
                fillColor: FB_LIGHT_PRIMARY,
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomTextformfield(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: Colors.grey,
                hintText: 'Username',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: usernameController,
                fillColor: FB_LIGHT_PRIMARY,
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomTextformfield(
                isObscure: _obscurePassword,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: Colors.grey,
                hintText: 'Password',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: passwordController,
                fillColor: FB_LIGHT_PRIMARY,
                toggleIcon: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              Text(
                '(Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character.)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenUtil().setSp(10),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomTextformfield(
                isObscure: _obscureConfirmPassword,
                hintText: 'Confirm Password',
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: Colors.grey,
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: confirmpasswordController,
                fillColor: FB_LIGHT_PRIMARY,
                toggleIcon: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have an account already? ',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, '/login'),
                    child: Text(
                      'Login here',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: FB_PRIMARY,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CustomInkwellButton(
                onTap: () => register(),
                bgColor: FB_PRIMARY,
                height: ScreenUtil().setHeight(45),
                width: ScreenUtil().screenWidth,
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.bold,
                buttonName: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
