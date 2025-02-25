import 'package:flutter/material.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 33),
        centerTitle: true,
        title: const Text("Payment Methods"),
      ),
      body: const Placeholder(),
    );
  }
}
