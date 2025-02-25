import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/widgets/comparison_table.dart';

import 'cubit/comparison_cubit.dart';
import 'cubit/comparison_states.dart';

class ComparisonTab extends StatelessWidget {
  const ComparisonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ComparisonCubit, ComparisonStates>(
          listener: (context, state) {
            if (state is ComparisonFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text("Failed to load comparison data. Please try again."),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is Comparisonloading) {
              return const Center(child: CircularProgressIndicator());
            }

            final selectedProducts =
                context.read<ComparisonCubit>().selectedProducts;

            if (selectedProducts.isEmpty) {
              return const Center(
                child: Text(
                  "No products selected for comparison.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            }

            return ComparisonTable(selectedProducts: selectedProducts);
          },
        ),
      ),
    );
  }
}
