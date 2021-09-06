import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pasabahce_artifacts/screens/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        onDrawerChanged: (bool x) {

        },
        body: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back))
              ],
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
                    Text('Let’s sign you in',
                        style: TextStyle(fontSize: 30.sp)),
                    SizedBox(height: 7.h),
                    Text(
                      'Welcome back, you’ve been missed!',
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
                              name: 'Username or email',
                            ),
                            SizedBox(height: 10),
                            NamedTextField(name: 'Password'),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                    value: rememberMe,
                                    onChanged: (newValue) {
                                      setState(() {
                                        rememberMe = newValue!;
                                      });
                                    }),
                                Text('Remember me',
                                    style: TextStyle(fontSize: 15)),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/forgot_password');
                                    },
                                    child: Text('Forgot password?',
                                        style: TextStyle(fontSize: 15)))
                              ],
                            ),
                            SizedBox(height: 50.h),
                            SignButton(
                              label: 'sign in',
                              onTap: () {
                                Navigator.pushNamed(context, '/home_page');
                              },
                            ),
                            SizedBox(height: 25.h),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
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
                        Navigator.popAndPushNamed(context, '/sign_up');
                      },
                      child: Text('Don’t have an account? Sign Up'),
                    ),
                    SizedBox(
                      height: 20,
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
