import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_details/widgtes/my_details_body.dart';

class MyDetailsView extends StatelessWidget {
  const MyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 33),
        centerTitle: true,
        title: Text(
          "My Details",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const MyDetailsBody(),
    );
  }
}
