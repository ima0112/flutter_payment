import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_payment/main.dart';
import 'package:flutter_payment/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePaymnet {
  Map<String, dynamic>? paymentIntent;

  static final StripePaymnet _singleton = StripePaymnet._internal();

  factory StripePaymnet() {
    return _singleton;
  }

  StripePaymnet._internal();

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('100', 'USD');

      //Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Ikay'))
          .then((value) {});

      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (_) => const SuccessDialog(),
        );

        //Clear paymentIntent variable after successful payment
        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      if (kDebugMode) {
        print('Error is:---> $e');

        showDialog(
          context: navigatorKey.currentContext!,
          builder: (_) => const FailedDialog(),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': _calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  _calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
