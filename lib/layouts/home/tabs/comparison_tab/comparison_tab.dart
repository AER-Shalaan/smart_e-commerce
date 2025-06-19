import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/view_model/comparison_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/view_model/comparison_states.dart';
import 'package:smart_ecommerce/layouts/home/provider/comparison_category_provider.dart';
import 'widgets/comparison_table.dart';

class ComparisonTab extends StatefulWidget {
  const ComparisonTab({super.key, required this.token, required this.userId});
  final String token;
  final String userId;

  @override
  State<ComparisonTab> createState() => _ComparisonTabState();
}

class _ComparisonTabState extends State<ComparisonTab> {
  bool _calledOnce = false;
  List<Map<String, dynamic>> _products = [];

  void _fetchData() {
    context.read<ComparisonViewModel>().fetchComparisons(
      buyerId: widget.userId,
      token: widget.token,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_calledOnce) {
      _calledOnce = true;
      _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategory =
        Provider.of<ComparisonCategoryProvider>(context).selectedCategory;

    return BlocBuilder<ComparisonViewModel, ComparisonStates>(
      builder: (context, state) {
        if (state is ComparisonLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ComparisonError) {
          return Center(child: Text(state.message));
        } else if (state is ComparisonSuccess) {
          _products = List<Map<String, dynamic>>.from(
            state.data[selectedCategory] ?? [],
          );
          if (_products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.table_chart,
                    color: Theme.of(context).colorScheme.shadow,
                    size: 46,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "No products to compare",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Start adding products to see the comparison",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }
          return ComparisonTable(
            selectedProducts: _products,
            categoryName: selectedCategory,
            onRemove: (index) {
              final item = _products[index];
              context.read<ComparisonViewModel>().removeItem(
                itemId: item['Item_ID'] ?? item['item_id'],
                buyerId: widget.userId,
                token: widget.token,
                currentCategory: selectedCategory,
                context: context,
              );
            },
          );
        }
        return const SizedBox(); // Initial
      },
    );
  }
}
