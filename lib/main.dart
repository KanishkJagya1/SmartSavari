import 'package:flutter/material.dart';
import 'package:flutter_first_app/app_screens/login.dart'; // Make sure this import is correct
import 'package:flutter_first_app/app_screens/register.dart'; // Import the Register page
import 'package:flutter_first_app/app_screens/splashscreen.dart';

import 'app_screens/home.dart';
import 'app_screens/req_permission_access.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.red), // Change to your desired color
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => MyLogin(),
        '/register': (context) => RegisterPage(), // Route for register page
      },
    );
  }
}

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Your background and positioned widgets

          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5,
                right: 35,
                left: 35,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Gmail login here
                    },
                    child: Text(
                      'Login with Gmail',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Phone login here
                    },
                    child: Text(
                      'Login with Phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff4c505b),
                        child: IconButton(
                          onPressed: () async {
                            // Show location permission pop-up
                            bool allowLocation = await showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text("Allow Location Access?"),
                                content: Text("Do you want to allow access to your location?"),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, true),
                                    child: Text("Yes"),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, false),
                                    child: Text("No"),
                                  ),
                                ],
                              ),
                            );

                            if (allowLocation) {
                              // Navigate to HomeScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            } else {
                              // Navigate to LocationPermissionScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationPermissionScreen()),
                              );
                            }
                          },
                          color: Colors.white,
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
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

