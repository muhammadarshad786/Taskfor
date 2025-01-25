import 'package:flutter/material.dart';
import 'package:task_app/Widget/check.dart';
import 'package:task_app/Authentication_Screen/registeration_page.dart';
import 'package:task_app/Home/home_screen.dart';
import 'package:task_app/Network/auth_api_test.dart';
import 'package:task_app/Widget/button_for_google_facebook.dart';
import 'package:task_app/Widget/button_for_sig_in.dart';
import 'package:task_app/navigationbar.dart';
import 'package:task_app/responsive.dart';
import 'package:task_app/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool show = false;
  String _errorMessage = '';

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 7) {
      return 'Password must be at least 7 characters long';
    }
    return null;
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userService = UserService();
        bool isLoggedIn =
            await userService.login(_email.text.trim(), _password.text.trim());
        if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } catch (e) {
        setState(() {
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: TextButton.icon(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Splash(),
                ),
                (route) => false,
              );
            },
            label: const Icon(Icons.arrow_back_sharp),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: getWidth(20),
                  top: getHeight(20),
                  bottom: getHeight(20),
                  right: getWidth(20)),
              child: Image.asset(
                'assets/Icons/splash.png',
                height: getHeight(100),
                width: getWidth(334),
              ),
            ),
            Center(
                child: Text(
              'Welcome Back',
              style: TextStyle(
                  fontSize: getFont(32),
                  fontFamily: 'UrbanistBold',
                  fontWeight: FontWeight.w700),
            )),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: getWidth(20),
                        right: getWidth(20),
                        bottom: getHeight(20)),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.08),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            fontFamily: 'UrbanistRegular',
                            fontWeight: FontWeight.w400,
                            fontSize: getFont(14)),
                        prefixIcon: Image.asset('assets/Icons/Message.png'),
                      ),
                      validator: _validateEmail,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: getWidth(20),
                        right: getWidth(20),
                        bottom: getHeight(20)),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.08),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontFamily: 'UrbanistRegular',
                              fontWeight: FontWeight.w400,
                              fontSize: getFont(14)),
                          prefixIcon: Image.asset('assets/Icons/Lock1.png'),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  show = !show;
                                });
                              },
                              icon: show
                                  ? Icon(Icons.remove_red_eye)
                                  : Image.asset('assets/Icons/Hide.png'))),
                      obscureText: show,
                      validator: _validatePassword,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCheckbox(),
                      SizedBox(
                        width: getWidth(10),
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                            fontFamily: 'UrbanistRegular',
                            fontWeight: FontWeight.w600,
                            fontSize: getFont(14)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(20)),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(left: getWidth(20), top: getHeight(20)),
              child: CustomButtonWidget(
                label: 'Login',
                onSubmit: _login,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getHeight(20)),
              child: Center(
                  child: InkWell(
                child: Text(
                  'Forgot the password?',
                  style: TextStyle(
                      fontFamily: 'UrbanistRegular',
                      fontWeight: FontWeight.w600,
                      color: Color(0xffEC3F2E),
                      fontSize: getFont(16)),
                ),
                onTap: () {},
              )),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: getHeight(20), bottom: getHeight(20)),
              child: Center(
                  child: Text(
                'or continue with',
                style: TextStyle(
                    fontFamily: 'UrbanistRegular',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff616161),
                    fontSize: getFont(16)),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NeumorphicButton(
                  onPressed: () {},
                  child: Image.asset(
                    'assets/Icons/facebook.png',
                    width: getWidth(24),
                    height: getHeight(24),
                  ),
                ),
                SizedBox(
                  width: getWidth(20),
                ),
                NeumorphicButton(
                  onPressed: () {},
                  child: Image.asset(
                    'assets/Icons/google.png',
                    width: getWidth(24),
                    height: getHeight(24),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: getHeight(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9E9E9E),
                        fontSize: getFont(14)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationPage()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontFamily: 'UrbanistRegular',
                          fontWeight: FontWeight.w600,
                          color: Color(0xffEC3F2E),
                          fontSize: getFont(14)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
