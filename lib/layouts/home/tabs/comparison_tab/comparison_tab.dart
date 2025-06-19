import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/widgets/comparison_table.dart';

class ComparisonTab extends StatelessWidget {
  const ComparisonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ComparisonTable(selectedProducts: []));
  }
}
