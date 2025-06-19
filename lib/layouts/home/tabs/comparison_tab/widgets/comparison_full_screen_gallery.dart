import 'package:flutter/material.dart';

class ComparisonFullScreenGallery extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const ComparisonFullScreenGallery({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0,
  });

  @override
  State<ComparisonFullScreenGallery> createState() => _ComparisonFullScreenGalleryState();
}

class _ComparisonFullScreenGalleryState extends State<ComparisonFullScreenGallery> {
  late PageController _pageController;
  late int _current;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    _pageController = PageController(initialPage: _current);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface, // Use theme surface/background
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
          icon: Icon(Icons.close, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "${_current + 1} / ${widget.imageUrls.length}",
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 12) Navigator.pop(context);
        },
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.imageUrls.length,
          onPageChanged: (i) => setState(() => _current = i),
          itemBuilder: (context, i) => InteractiveViewer(
            minScale: 0.8,
            maxScale: 3,
            child: Center(
              child: Image.network(
                widget.imageUrls[i],
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.broken_image,
                  size: 100,
                  color: theme.disabledColor.withOpacity(0.17),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
