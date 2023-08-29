import 'package:flutter/material.dart';
import 'package:flutter_first_app/app_screens/login.dart';

import '../main.dart'; // Import the MyLogin page

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _blueTransitionHeight = 1.0; // Control blue transition
  bool _showBus = false; // Control bus animation
  double _opacity = 1.0; // Control SmartSavari opacity

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  // Start animation after a delay
  void _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 10)); // Delay before showing blue transition
    setState(() {
      _blueTransitionHeight = MediaQuery.of(context).size.height;
    });
    await Future.delayed(Duration(seconds: 2)); // Delay before showing the bus
    setState(() {
      _showBus = true;
    });
    await Future.delayed(Duration(seconds: 1)); // Delay before fading SmartSavari
    setState(() {
      _opacity = 1.0;
    });
    await Future.delayed(Duration(seconds: 1)); // Delay before navigating
    _navigateToLogin(context);
  }

  Future<void> _navigateToLogin(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: _blueTransitionHeight,
            color: Colors.blue,
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: _opacity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: _showBus ? 150 : 0,
                    child: Image.asset('assets/bus.png'), // Add your bus image asset
                  ),
                  SizedBox(height: 20),
                  Text(
                    'SmartSavari',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
