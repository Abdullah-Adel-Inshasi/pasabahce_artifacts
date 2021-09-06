import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/screens/screens.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close_sharp),
              color: Colors.black,
              iconSize: 30),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Text('Enter the 4 digit code sent to:',
                style: TextStyle(fontSize: 22)),
            Text('1 222 555 6677',
                style: TextStyle(color: Color(0xFFCC9D76), fontSize: 30)),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'We\'ve sent a 4 digit code to your phone number. Please enter the verification code.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF676870)),
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: PinPut(
                fieldsCount: 4,
                eachFieldWidth: 42,
                eachFieldHeight: 54,
                withCursor: true,
                animationDuration: Duration(milliseconds: 200),
                animationCurve: Curves.easeIn,
                obscureText: '•',
                textStyle: TextStyle(fontSize: 30),
                followingFieldDecoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.grey))),
                submittedFieldDecoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: Color(0xFFCC9D76)))),
                selectedFieldDecoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFCC9D76), width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Didn’t receive the SMS?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF676870)),
            ),
            Text(
              //TODO : when the timer reaches 0:0 make a (request new code) button
              'Request new code in 00:00',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            SignButton(
                label: 'Proceed',
                onTap: () {
                  Navigator.pushNamed(context, '/verified');
                })
          ],
        ),
      ),
    );
  }
}
