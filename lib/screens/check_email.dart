import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/screens/screens.dart';
import 'package:pinput/pin_put/pin_put.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            color: Colors.black,
            iconSize: 30,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 150),
            Image.asset('assets/images/check_email.png'),
            Text(
              'Check your email',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'We\'ve sent you instructions on how to reset the password (also check the Spam folder).',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF272833).withOpacity(0.7)),
              ),
            ),
            Spacer(),
            SignButton(
                label: 'Open my email',
                onTap: () {
                  Navigator.pushNamed(context, '/verification');
                }),
            SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}


