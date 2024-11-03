import 'package:flutter/material.dart';

class BudgetRequirementsPage extends StatelessWidget {
  // Sample data for budget requirements
  final double packageCost = 5000.00; // Cost of the travel package
  final double flightCost = 3000.00; // Estimated flight cost
  final double accommodationCost = 2000.00; // Estimated accommodation cost
  final double foodCost = 1500.00; // Estimated food cost
  final double activitiesCost = 1000.00; // Estimated activities cost
  final double miscellaneousCost = 500.00; // Miscellaneous expenses

  // List of required travel items
  final List<String> requiredItems = [
    "Passport",
    "Travel Insurance",
    "Clothing (appropriate for the destination)",
    "Comfortable Footwear",
    "Toiletries",
    "First Aid Kit",
    "Travel Adapter",
    "Mobile Phone & Charger",
    "Camera",
    "Sunglasses",
    "Snacks",
    "Water Bottle"
  ];

  @override
  Widget build(BuildContext context) {
    double totalEstimatedCost = packageCost + flightCost + accommodationCost + foodCost + activitiesCost + miscellaneousCost;

    return Scaffold(
      appBar: AppBar(
        title: Text("Budget Requirements for Travel"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Estimated Costs",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildCostItem("Travel Package", packageCost),
            _buildCostItem("Flight Cost", flightCost),
            _buildCostItem("Accommodation", accommodationCost),
            _buildCostItem("Food", foodCost),
            _buildCostItem("Activities", activitiesCost),
            _buildCostItem("Miscellaneous", miscellaneousCost),
            Divider(thickness: 2, color: Colors.grey),
            _buildCostItem("Total Estimated Cost", totalEstimatedCost, isTotal: true),
            SizedBox(height: 20),
            Text(
              "Required Items for Travel",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: requiredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text(requiredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCostItem(String title, double cost, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "₹${cost.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}