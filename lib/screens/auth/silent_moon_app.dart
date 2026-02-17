import 'package:flutter/material.dart';
import 'package:meditationapp_task/screens/auth/signin_screen.dart';
import 'package:meditationapp_task/screens/auth/signup_screen.dart';

void main() {
  runApp(SilentMoonApp());
}


class SilentMoonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silent Moon',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Spacer(),
            Row(
              mainAxisAlignment: .center,
              spacing: 8,
              children: [

            Text(
              "Silent",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
                Image.asset('assets/images/img_1.png', width: 22,),
                Text(
                  "Moon",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 80,),
            Image.asset('assets/images/img.png'),


            SizedBox(height: 110),
            Text("We are what we do",
                style: TextStyle(fontSize: 30, color: Color.fromRGBO(63, 65, 78, 1))),
            SizedBox(height: 14,),
            Text("Thousand of people are using silent moon\nfor smalls meditation ",
                textAlign: .center,
                style: TextStyle(fontSize: 16, color: Color.fromRGBO(161, 164, 178, 1))),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55),
                backgroundColor: Color.fromRGBO(142, 151, 253, 1)
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
              child: Text("SIGN UP", style: TextStyle(color: Colors.white),),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignInScreen()));
              },
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Text("ALREADY HAVE ACCOUNT? ", style: TextStyle(color: Color.fromRGBO(161, 164, 178, 1)),),
                  Text("LOG IN", style: TextStyle(color: Color.fromRGBO(142, 151, 253, 1)),),

                ],
              )
            ),
          ],
        ),
      ),
      )
    );
  }
}
