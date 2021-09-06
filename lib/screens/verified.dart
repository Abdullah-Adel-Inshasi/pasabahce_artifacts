import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/screens/screens.dart';

class Verified extends StatelessWidget {
  const Verified({Key? key}) : super(key: key);

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
            Image.asset('assets/images/Verified.png'),
            Text(
              'Phone verified',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Congratulations, your phone number has been verified. You can now start using the app.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF272833).withOpacity(0.7)),
              ),
            ),
            Spacer(),
            SignButton(
                label: 'Continue',
                onTap: () {
                  Navigator.pushNamed(context, '/home_page');
                }),
            SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}


