import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundraising/screens/onboard.dart';
import 'screens/topup_screen.dart';
import 'screens/payment_method_screen.dart';
import 'screens/payment_confirmation_screen.dart';
import 'screens/transaction_history_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donation App',
      theme: ThemeData(
        primaryColor: Color(0xFF4ECDC4),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF4ECDC4),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4ECDC4),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/signin': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/topup': (context) => TopupScreen(),
        '/payment-method': (context) => PaymentMethodScreen(),
        '/payment-confirmation': (context) => PaymentConfirmationScreen(),
        '/transaction-history': (context) => TransactionHistoryScreen(),
      },
    );
  }
}
