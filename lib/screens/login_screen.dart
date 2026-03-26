import 'package:bautista_mobprog/constants.dart';
import 'package:bautista_mobprog/screens/home_screen.dart';
import 'package:bautista_mobprog/widgets/custom_dialogs.dart';
import 'package:bautista_mobprog/widgets/custom_inkwell_button.dart';
import 'package:bautista_mobprog/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void login() {
    if (usernameController.text == 'user' && passwordController.text == 'user') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (build) => HomeScreen(username: usernameController.text),
        ),
      );
    } else {
      customDialog(
        context,
        title: 'Error',
        content: 'Username and password does not match',
      );
    }
  }

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FB_DARK_PRIMARY,
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          color: FB_DARK_PRIMARY,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(25),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/doomscroll.png',
                        height: ScreenUtil().setHeight(150),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      CustomTextformfield(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: usernameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter username' : null,
                        onSaved: (value) => usernameController.text = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: Colors.grey,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Username',
                        fillColor: FB_LIGHT_PRIMARY,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      CustomTextformfield(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: passwordController,
                        isObscure: _obscurePassword,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your password' : null,
                        onSaved: (value) => passwordController.text = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: Colors.grey,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Password',
                        fillColor: FB_LIGHT_PRIMARY,
                        toggleIcon: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      SizedBox(height: ScreenUtil().setHeight(50)),
                      CustomInkwellButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            login();
                          }
                        },
                        bgColor: FB_PRIMARY,
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().screenWidth,
                        buttonName: 'Login',
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_LIGHT_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You don\'t have an account? ',
                        style: TextStyle(
                          color: FB_TEXT_COLOR_WHITE,
                          fontSize: ScreenUtil().setSp(12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: FB_PRIMARY,
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
