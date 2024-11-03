import 'package:flutter/material.dart';
import 'package:global/Customer_signin/signed_in/Transactions.dart'; // Ensure this path is correct

class Package {
  final String name;
  final double price;
  final String description;

  Package({required this.name, required this.price, required this.description});
}

class PackageListPage extends StatelessWidget {
  final List<Package> packages = [
    Package(name: "Tropical Paradise", price: 5000, description: "Explore beautiful tropical landscapes."),
    Package(name: "Mountain Adventure", price: 7000, description: "Experience thrilling mountain tours."),
    Package(name: "City Lights", price: 4500, description: "Discover famous city landmarks and nightlife."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Packages"),
        backgroundColor: Colors.orangeAccent[300],
      ),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(package.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text("₹${package.price.toStringAsFixed(2)}"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionPage(selectedPackage: package), // Pass the selected package
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}