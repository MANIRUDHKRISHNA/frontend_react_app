import 'package:global/login_screen.dart';
import 'package:global/main.dart';
import 'package:flutter/material.dart';
import 'orders.dart';
import 'Transactions.dart';
import 'CustomerSupport.dart';
import 'Tips.dart';
import 'Profile.dart';
import 'Notification.dart';
import 'settings.dart';
import 'package:global/Customer_signin/signed_in/Packages.dart';
import 'package:global/Customer_signin/signed_in/Budget.dart';




// Home Screen with App Drawer
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to GTT'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(), // Adding App Drawer here
      body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/background.jpg"), // Path to your background image
    fit: BoxFit.cover, // Cover the entire screen
    ),
    ),
    child: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon:Icon(Icons.travel_explore,color:Colors.orange),
                    onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>TravelPackagesPage()
                    ));

                    },
            ),
              Text('Travel Packages',style: TextStyle(fontSize: 18))
              ],
            ),
          ),

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.shopping_cart, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PackageListPage(),
                    ));
                  },
                ),
                Text('Added packages', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.monetization_on, color: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BudgetRequirementsPage(),
                  ),
                );
              },
            ),
            Text(
              'Budget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.settings, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  },
                ),
                Text('Settings', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
// App Drawer Widget
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Text(
                      'C',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Customer Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatbotScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.tips_and_updates),
            title: Text('Tips'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TipsScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Navigate back to WelcomeScreen when the user logs out
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
          ),

        ],
      ),
    );
  }
}