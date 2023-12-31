import 'package:flutter/material.dart';
import 'package:flutter_payment/stripe_payment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Make Payment'),
              onPressed: () async {
                await StripePaymnet().makePayment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
