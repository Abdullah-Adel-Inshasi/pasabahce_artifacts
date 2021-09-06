import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/models/artifact_model.dart';
import 'package:pasabahce_artifacts/screens/freaking_around.dart';
import 'screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoarding(),
        initialRoute: '/onboarding',
        routes: {
          '/onboarding': (context) => OnBoarding(),
          '/sign_up': (context) => SignUp(),
          '/sign_in' : (context)=> SignIn(),
          '/forgot_password' : (context)=> ForgotPassword(),
          '/check_email' :(context)=> CheckEmail(),
          '/verification' : (context)=> PhoneVerification(),
          '/verified' : (context) => Verified(),
          '/home_page' : (context)=> HomePage(),
          '/product_page':(context)=>ProductPage(artifact: artifacts[0],)
        },
      ),
    );
  }
}
