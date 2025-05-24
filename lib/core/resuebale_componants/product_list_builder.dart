import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:shimmer/shimmer.dart';

typedef ProductFetcher =
    Future<Either<Failure, List<Products>>> Function(int page);

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

  Widget _buildProductItem(BuildContext context, int index) {
    final product = _products[index].data!;
    return AnimatedProductItem(
      index: index,
      child: ItemWidget(
        key: ValueKey(product.itemID),
        productData: product,
        token: widget.token,
        userId: widget.userId,
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
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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
          child:
              _error != null
                  ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: _fetchInitialProducts,
                          child: const Text("Try Again"),
                        ),
                      ],
                    ),
                  )
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
                        return _buildProductItem(context, index);
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

class AnimatedProductItem extends StatefulWidget {
  const AnimatedProductItem({
    super.key,
    required this.child,
    required this.index,
  });

  final Widget child;
  final int index;

  @override
  State<AnimatedProductItem> createState() => _AnimatedProductItemState();
}

class _AnimatedProductItemState extends State<AnimatedProductItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnim;
  late Animation<Offset> _offsetAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _opacityAnim = Tween<double>(begin: 0, end: 1).animate(_controller);
    _offsetAnim = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(_controller);

    Future.delayed(Duration(milliseconds: widget.index * 30), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnim,
      child: FadeTransition(opacity: _opacityAnim, child: widget.child),
    );
  }
}
