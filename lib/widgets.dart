import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 100.0,
          ),
          SizedBox(height: 10.0),
          Text("Payment Successful!"),
        ],
      ),
    );
  }
}

class FailedDialog extends StatelessWidget {
  const FailedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              SizedBox(width: 20.0),
              Text("Payment Failed"),
            ],
          ),
        ],
      ),
    );
  }
}
