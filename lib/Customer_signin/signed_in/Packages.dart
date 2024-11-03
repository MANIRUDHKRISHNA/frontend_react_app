import 'package:flutter/material.dart';

class TravelPackage {
  final String title;
  final String location;
  final double price;
  final String description;
  final String imageUrl; // Added imageUrl field

  TravelPackage({
    required this.title,
    required this.location,
    required this.price,
    required this.description,
    required this.imageUrl, // Updated constructor
  });
}

// List of travel packages with unique images
final List<TravelPackage> travelPackages = [
  TravelPackage(
    title: "Romantic Paris Getaway",
    location: "Paris, France",
    price: 50000,
    description: "Experience the City of Love with a romantic escape to Paris. Includes Eiffel Tower visit, river cruise, and more.",
    imageUrl: "assets/images/paris.jpg", // Image path for Paris
  ),
  TravelPackage(
    title: "Safari Adventure",
    location: "Nairobi, Kenya",
    price: 65000,
    description: "Explore Kenya's wildlife on a thrilling safari. Witness the beauty of African nature and enjoy luxurious camps.",
    imageUrl: "assets/images/safari.jpg", // Image path for Safari
  ),
  TravelPackage(
    title: "Tokyo City Lights",
    location: "Tokyo, Japan",
    price: 72000,
    description: "Discover the vibrant culture and technology of Tokyo with a guided city tour, culinary experiences, and more.",
    imageUrl: "assets/images/tokyo.jpg", // Image path for Tokyo
  ),
  TravelPackage(
    title: "Swiss Alps Retreat",
    location: "Zurich, Switzerland",
    price: 90000,
    description: "Escape to the Swiss Alps and enjoy skiing, hiking, and relaxing in breathtaking scenery.",
    imageUrl: "assets/images/swiss_alps.jpg", // Image path for Swiss Alps
  ),
  TravelPackage(
    title: "Sydney Beach and City",
    location: "Sydney, Australia",
    price: 68000,
    description: "Experience Sydney's iconic beaches and vibrant city life, including the Sydney Opera House and Bondi Beach.",
    imageUrl: "assets/images/sydney.jpg", // Image path for Sydney
  ),
  TravelPackage(
    title: "Ancient Egypt",
    location: "Cairo, Egypt",
    price: 55000,
    description: "Dive into history with a tour of Egypt’s ancient monuments, including the Pyramids, Sphinx, and Nile River cruise.",
    imageUrl: "assets/images/egypt.jpg", // Image path for Egypt
  ),
  TravelPackage(
    title: "New York City Vibes",
    location: "New York, USA",
    price: 78000,
    description: "Enjoy the bustling life of NYC with a tour of Times Square, Central Park, and the Statue of Liberty.",
    imageUrl: "assets/images/new_york.jpg", // Image path for New York
  ),
  TravelPackage(
    title: "Santorini Sunset Escape",
    location: "Santorini, Greece",
    price: 62000,
    description: "Relax in Santorini with its iconic sunsets, crystal-clear waters, and scenic villages.",
    imageUrl: "assets/images/santorini.jpg", // Image path for Santorini
  ),
  TravelPackage(
    title: "The Great Wall Experience",
    location: "Beijing, China",
    price: 56000,
    description: "Walk the historic Great Wall and explore Beijing’s Forbidden City and unique cuisine.",
    imageUrl: "assets/images/great_wall.jpg", // Image path for Great Wall
  ),
  TravelPackage(
    title: "Desert Adventure",
    location: "Dubai, UAE",
    price: 60000,
    description: "Discover the magic of Dubai with a desert safari, Burj Khalifa visit, and shopping extravaganza.",
    imageUrl: "assets/images/dubai.jpg", // Image path for Dubai
  ),
];

class TravelPackagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Packages"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: travelPackages.length,
        itemBuilder: (context, index) {
          final package = travelPackages[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            color: Colors.orange[50],
            child: ListTile(
              leading: Image.asset(package.imageUrl, width: 50, height: 50, fit: BoxFit.cover), // Display image
              title: Text(package.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${package.location} - ₹${package.price.toStringAsFixed(0)}"),
                  SizedBox(height: 4),
                  Text(package.description, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PackageDetailPage(package: package),
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

class PackageDetailPage extends StatelessWidget {
  final TravelPackage package;

  PackageDetailPage({required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(package.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(package.imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover), // Display full image
            SizedBox(height: 20),
            Text(
              package.location,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Price: ₹${package.price.toStringAsFixed(0)}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              package.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
