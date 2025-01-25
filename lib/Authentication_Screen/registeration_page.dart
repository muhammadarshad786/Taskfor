import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task_app/Authentication_Screen/login_screen.dart';
import 'package:task_app/Widget/button_for_google_facebook.dart';
import 'package:task_app/Widget/button_for_sig_in.dart';
import 'package:task_app/Widget/toggle_button.dart';
import 'package:task_app/responsive.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _selectedGender;

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Icon(Icons.arrow_back),
            ),
            SizedBox(width: getWidth(20)),
            Text(
              'Create Account',
              style: TextStyle(
                  fontFamily: 'UrbanistRegular',
                  fontWeight: FontWeight.w700,
                  fontSize: getFont(24),
                  color: Color(0xff212121)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(20)),
                child: ToggleButton(
                  width: getWidth(360),
                  height: getHeight(60),
                  toggleBackgroundColor: Colors.white,
                  toggleBorderColor: (Colors.grey[350])!,
                  toggleColor: (Colors.red)!,
                  activeTextColor: Colors.white,
                  inactiveTextColor: Colors.red,
                  leftDescription: 'Consumer',
                  rightDescription: 'Provider',
                  onLeftToggleActive: () {},
                  onRightToggleActive: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(20)),
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.08),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w400,
                        fontSize: getFont(14),
                        color: Color(0xff9E9E9E)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(20)),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.08),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w400,
                        fontSize: getFont(14),
                        color: Color(0xff9E9E9E)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(20)),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.08),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w400,
                        fontSize: getFont(14),
                        color: Color(0xff9E9E9E)),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/Icons/Messagefor.png'),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(20)),
                child: DropdownButtonFormField<String>(
                  icon: Image.asset('assets/Icons/Arrow - Down 2.png'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.08),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Gender',
                    hintStyle: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w400,
                        fontSize: getFont(14),
                        color: Color(0xff9E9E9E)),
                  ),
                  value: _selectedGender,
                  items: _genderOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getWidth(20),
                  right: getWidth(20),
                ),
                child: IntlPhoneField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.08),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          fontFamily: 'UrbanistRegular',
                          fontWeight: FontWeight.w400,
                          fontSize: getFont(14),
                          color: Color(0xff9E9E9E))),
                  initialCountryCode: 'PK',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  validator: (value) {
                    if (value == null || value.completeNumber.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(20)),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.08),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w400,
                        fontSize: getFont(14),
                        color: Color(0xff9E9E9E)),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/Icons/lock.png'),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(20)),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.08),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w400,
                        fontSize: getFont(14),
                        color: Color(0xff9E9E9E)),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/Icons/lock.png'),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing you agree to our Terms of ',
                        style: TextStyle(
                            fontFamily: 'UrbanistRegular',
                            fontWeight: FontWeight.w600,
                            fontSize: getFont(16),
                            color: Color(0xff9E9E9E)),
                      ),
                      TextSpan(
                        text: 'Service and Privacy Policy',
                        style: TextStyle(
                            fontFamily: 'UrbanistRegular',
                            fontWeight: FontWeight.w600,
                            fontSize: getFont(16),
                            color: Color(0xff704B8D)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: getWidth(20), top: getHeight(20)),
                child: CustomButtonWidget(
                  label: 'Register',
                  onSubmit: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform registration
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getHeight(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an account?',
                      style: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9E9E9E),
                        fontSize: getFont(14),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationPage()));
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'UrbanistRegular',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0A84FF),
                          fontSize: getFont(14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: getWidth(20), bottom: getHeight(20)),
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
              Padding(
                padding: EdgeInsets.only(
                    //left: getWidth(20),
                    top: getWidth(20),
                    bottom: getHeight(20)),
                child: Row(
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
                    const SizedBox(
                      width: 20,
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
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
