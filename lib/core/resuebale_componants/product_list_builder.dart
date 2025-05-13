import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:animate_do/animate_do.dart';
import 'package:shimmer/shimmer.dart';

typedef ProductFetcher = Future<Either<Failure, List<Products>>> Function(int page);

class ProductListBuilder extends StatefulWidget {
  const ProductListBuilder({
    super.key,
    required this.label,
    required this.fetchFunction,
    required this.token,
    required this.userId,
  });

  final String label;
  final ProductFetcher fetchFunction;
  final String token;
  final String userId;

  @override
  State<ProductListBuilder> createState() => _ProductListBuilderState();
}

class _ProductListBuilderState extends State<ProductListBuilder> {
  final ScrollController _scrollController = ScrollController();
  List<Products> _products = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  bool _firstLoadDone = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchInitialProducts();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMore) {
      _fetchMoreProducts();
    }
  }

  Future<void> _fetchInitialProducts() async {
    setState(() => _isLoading = true);
    final result = await widget.fetchFunction(_currentPage);
    result.fold(
      (failure) => setState(() {
        _error = failure.message;
        _isLoading = false;
      }),
      (fetchedProducts) => setState(() {
        _products = fetchedProducts;
        _hasMore = fetchedProducts.length >= 10;
        _isLoading = false;
        _firstLoadDone = true;
      }),
    );
  }

  Future<void> _fetchMoreProducts() async {
    setState(() => _isLoading = true);
    final nextPage = _currentPage + 1;
    final result = await widget.fetchFunction(nextPage);
    result.fold(
      (failure) => setState(() {
        _error = failure.message;
        _isLoading = false;
      }),
      (fetchedProducts) => setState(() {
        _currentPage = nextPage;
        _products.addAll(fetchedProducts);
        _hasMore = fetchedProducts.length >= 10;
        _isLoading = false;
      }),
    );
  }

  Widget buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Text(
                widget.label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: isTablet ? 330 : 290,
          child: _error != null
              ? Center(child: Text(_error!))
              : _products.isEmpty && !_firstLoadDone
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, __) => buildShimmerItem(),
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemCount: 5,
                    )
                  : ListView.separated(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _products.length + (_hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < _products.length) {
                          final product = _products[index].data;
                          return FadeInUp(
                            from: 30,
                            delay: _firstLoadDone
                                ? Duration.zero
                                : Duration(milliseconds: index * 100),
                            duration: const Duration(milliseconds: 500),
                            child: ItemWidget(
                              key: ValueKey(product!.itemID),
                              productData: product,
                              token: widget.token,
                              userId: widget.userId,
                            ),
                          );
                        } else {
                          return const Center(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(strokeWidth: 2.5),
                            ),
                          );
                        }
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                    ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
