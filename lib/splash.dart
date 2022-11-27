import 'package:flutter/material.dart';

import 'login.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    gotologin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
    
        
        decoration: const BoxDecoration(
          image: DecorationImage(
          
            image: AssetImage('asset/splash.jpg'),
            
          ),
        ),
      ),
    );
  }

    Future<void> gotologin() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) =>  Loginpage (),
    ));
  }
}
