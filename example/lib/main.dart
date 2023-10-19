import 'package:flutter/material.dart';
import 'package:vnpay_client/vnpay_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final paymentUrl = 'example';

  void _onPaymentSuccess(data) {}

  void _onPaymentFailure(error) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              showVNPayScreen(
                context,
                paymentUrl: paymentUrl,
                onPaymentSuccess: _onPaymentSuccess,
                onPaymentError: _onPaymentFailure,
              );
            },
            child: const Text('Click me'),
          ),
        ),
      ),
    );
  }
}
