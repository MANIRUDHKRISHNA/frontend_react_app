// settings.dart

import 'package:flutter/material.dart';
import 'package:global/Customer_signin/signed_in/Privacy Policy.dart';
import 'package:global/Customer_signin/signed_in/Terms and Conditions.dart';
import 'package:global/login_screen.dart';
import 'package:global/Customer_signin/signed_in/About_us.dart';
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  String _language = 'English';
  List<String> _languages = ['English', 'Spanish', 'French','Mandarin Chinese','Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"), // Background image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.orange.withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dark Mode Setting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode'),
                Switch(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                ),
              ],
            ),
            Divider(thickness: 1),

            // Notifications Setting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                Switch(
                  value: _notifications,
                  onChanged: (value) {
                    setState(() {
                      _notifications = value;
                    });
                  },
                ),
              ],
            ),
            Divider(thickness: 1),

            // Language Setting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Language'),
                DropdownButton<String>(
                  value: _language,
                  items: _languages.map((String language) {
                    return DropdownMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _language = newValue!;
                    });
                  },
                ),
              ],
            ),
            Divider(thickness: 1),

            // Terms and Conditions
            ListTile(
              title: Text('Terms and Conditions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsandConditionsScreen()),
                );
                // Navigate to Terms and Conditions screen
              },
            ),
            Divider(thickness: 1),

            // Privacy Policy
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Navigate to Privacy Policy screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                );
              },
            ),
            Divider(thickness: 1),

            ListTile(
              title: Text('About us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompanyPage()),
                );
                // Navigate to Terms and Conditions screen
              },
            ),

            Divider(thickness: 1),

            // Logout
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(userType:'Customer' )),);
                // Logout functionality
              },
            ),
          ],
        ),
      ),
    ));
  }
}