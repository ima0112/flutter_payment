import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_payment/home_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  //Initialize Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();

  //Assign publishable key to flutter_stripe
  Stripe.publishableKey =
      'pk_test_51OC3pTHsw39B3mjXoIlcZy7EoYeVaw03oCn4rWrQqYQvpOr3HAYMVHMrX9TvQKiAeXZE5wY3KxwhKeHxBMBtDTS300BwRzZLNb';

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      //initial route
      home: const HomePage(),
    );
  }
}
