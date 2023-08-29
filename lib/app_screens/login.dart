import 'package:flutter/material.dart';
import 'package:flutter_first_app/app_screens/home.dart';
import 'package:flutter_first_app/app_screens/register.dart'; // Import the RegisterPage
import 'package:flutter_first_app/app_screens/req_permission_access.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: _buildLoginForm(context), // Add the login form widgets here
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the widgets vertically
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100), // Adjust the value as needed
          Text(
            'Welcome to',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          Text(
            'SMARTSAVARI',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          SizedBox(height: 30),
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
          SizedBox(height: 10),
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
          SizedBox(height: 30),
          ElevatedButton(
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
            child: Row(
              mainAxisSize: MainAxisSize.min, // Center the button
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Color(0xff4c505b),
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
            ),
          ),
          SizedBox(height: 10), // Add a small space between "Sign In" and "Sign Up" buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 27,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent, // Transparent background
              onPrimary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
