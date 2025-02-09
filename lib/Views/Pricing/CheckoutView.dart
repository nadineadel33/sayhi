import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  final String planName;
  final String price;

  const CheckoutView({super.key, required this.planName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You selected the $planName plan"),
            Text("Price: \$$price per month"),
            ElevatedButton(
              onPressed: () {
                // Payment logic here
              },
              child: Text("Proceed to Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
