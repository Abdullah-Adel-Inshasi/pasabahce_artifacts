import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pasabahce_artifacts/screens/screens.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: BackButton(),
          title: Text(
            'Reset Password'.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 670,
                margin: EdgeInsets.only(top: 0.h),
                padding: EdgeInsets.only(top: 40.h, left: 30.w, right: 30.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Forgot your password?',
                        style: TextStyle(
                            fontSize: 30.sp, fontWeight: FontWeight.w500)),
                    SizedBox(height: 9.h),
                    Text(
                        'Enter your email address and we will send you instructions on how to reset your password.',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFF676870), fontSize: 15)),
                    SizedBox(height: 37.h),
                    NamedTextField(name: 'Email address'),
                    SizedBox(height: 160),

                    SignButton(label: 'Recover Email', onTap: () {
                      Navigator.pushNamed(context, '/check_email');
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
