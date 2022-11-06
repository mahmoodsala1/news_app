import 'package:flutter/material.dart';
import 'package:news_app/modules/choose_country_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 6000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ChooseCountryScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/earth.jpg',
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
