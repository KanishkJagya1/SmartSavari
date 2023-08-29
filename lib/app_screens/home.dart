import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Destination'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map_background.jpg'), // Replace with your map image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter the Destination',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('Nearby Bus Stations'),
                    // Add your nearby bus station details here
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle QR code scanning
                },
                child: Text('Scan QR Code'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.payment),
                  SizedBox(width: 8),
                  Text('Payment Gateways'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.credit_card),
                  Icon(Icons.payment),
                  Icon(Icons.money),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
