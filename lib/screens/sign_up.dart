import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(
                'Sign up'.toUpperCase(),
              ),
              titleTextStyle: TextStyle(color: Colors.white),
              leading: BackButton(),
              backgroundColor: Colors.black,
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 670,
                margin: EdgeInsets.only(top: 0.h),
                padding: EdgeInsets.only(top: 30.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Create your account',
                        style: TextStyle(fontSize: 30.sp)),
                    SizedBox(height: 7.h),
                    Text(
                      'After your registration is complete,\n you can see our opportunity products.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18.sp, color: Color(0xFF676870)),
                    ),
                    SizedBox(height: 27.h),
                    Form(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          children: <Widget>[
                            NamedTextField(
                              name: 'Username',
                            ),
                            SizedBox(height: 10),
                            NamedTextField(name: 'Email'),
                            SizedBox(height: 10),
                            NamedTextField(name: 'Password'),
                            SizedBox(height: 10),
                            NamedTextField(name: 'Phone'),
                            SizedBox(height: 50.h),
                            SignButton(
                              onTap: () {
                                Navigator.pushNamed(context, '/home_page');
                              },
                              label: 'sign up',
                            ),
                            SizedBox(height: 25.h),
                          ],
                        ),
                      ),
                    ),
                    OtherSignUpMethods(
                      color: Color(0xFFDE4D3B),
                      label: 'Countinue with Google',
                      iconUrl: 'assets/images/gmail.png',
                    ),
                    SizedBox(height: 16),
                    OtherSignUpMethods(
                      iconUrl: 'assets/images/facebook.png',
                      label: 'Continue with Facebook',
                      color: Color(0xFF4267B2),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/sign_in');
                        print('daaaamn thats crazy af ');
                      },
                      child: Text('Already have an account? Sign In'),
                    )
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

class OtherSignUpMethods extends StatelessWidget {
  final String iconUrl;
  final String label;
  final Color color;

  const OtherSignUpMethods(
      {Key? key,
      required this.iconUrl,
      required this.label,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO : implement sign up with google/facebook
        print('sign up with');
      },
      child: Container(
        width: 240.w,
        height: 44.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: color, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(iconUrl),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NamedTextField extends StatelessWidget {
  final String name;

  const NamedTextField({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCC9D76), width: 2)),
        labelText: name,
        labelStyle: TextStyle(color: Colors.grey),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}

class SignButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SignButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 244.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Color(0xFFCC9D76)),
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontSize: 15, letterSpacing: 1.2),
          ),
        ),
      ),
    );
  }
}
