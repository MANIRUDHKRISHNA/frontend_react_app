import 'package:flutter/material.dart';
import 'package:global/Customer_signin/signed_in/orders.dart';

class TransactionPage extends StatelessWidget {
  final Package selectedPackage;
  static const double gstRate = 0.18; // 18% GST

  TransactionPage({required this.selectedPackage});

  @override
  Widget build(BuildContext context) {
    double gstAmount = selectedPackage.price * gstRate;
    double totalAmount = selectedPackage.price + gstAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
        backgroundColor: Colors.orangeAccent[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Package: ${selectedPackage.name}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Description: ${selectedPackage.description}"),
            SizedBox(height: 20),
            Text("Base Price: ₹${selectedPackage.price.toStringAsFixed(2)}"),
            SizedBox(height: 10),
            Text("GST (18%): ₹${gstAmount.toStringAsFixed(2)}"),
            Divider(thickness: 1, color: Colors.grey),
            Text(
              "Total Amount: ₹${totalAmount.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Code to process transaction can be added here
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Transaction Successful"),
                      content: Text("Thank you for choosing ${selectedPackage.name}!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context); // Go back to PackageListPage
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("Proceed to Payment", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}