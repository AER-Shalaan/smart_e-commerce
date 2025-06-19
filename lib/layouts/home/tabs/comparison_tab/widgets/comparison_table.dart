import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/widgets/comparison_carousel_image.dart';

class ComparisonTable extends StatelessWidget {
  final List<Map<String, dynamic>> selectedProducts;
  final String categoryName;
  final void Function(int index)? onRemove;

  const ComparisonTable({
    super.key,
    required this.selectedProducts,
    required this.categoryName,
    this.onRemove,
  });

  static final Set<String> _excludedKeys = {
    'item_id',
    'Item_ID',
    'buyer_id',
    'Buyer_ID',
    'image_cover',
    'Image_Cover',
    'images',
    'Images',
    'item_name',
    'Item_Name',
    'name',
    'Name',
  };

  List<String> getFeatures(List<Map<String, dynamic>> products) {
    Set<String> features = {};
    for (var p in products) {
      features.addAll(p.keys);
    }
    features.removeWhere((f) => _excludedKeys.contains(f));
    return features.toList();
  }

  String beautify(String key) {
    return key
        .replaceAll('_', ' ')
        .replaceAllMapped(RegExp(r'\b\w'), (m) => m.group(0)!.toUpperCase());
  }

  List<String> extractImages(Map<String, dynamic> product) {
    List<String> imgs = [];
    if (product['Image_Cover'] != null &&
        product['Image_Cover'].toString().isNotEmpty) {
      imgs.add(product['Image_Cover'].toString());
    }
    if (product['images'] is List) {
      imgs.addAll(List<String>.from(product['images']));
    }
    return imgs;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final features = getFeatures(selectedProducts);

    if (selectedProducts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.table_chart, size: 50, color: theme.primaryColor),
            const SizedBox(height: 12),
            Text("No products to compare!", style: theme.textTheme.titleLarge),
            const SizedBox(height: 7),
            Text(
              "Start by adding products to comparison.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double colWidth = screenWidth < 400 ? 115 : (screenWidth < 700 ? 145 : 170);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.cardColor,
        elevation: 1,
        centerTitle: true,
        title: Text(categoryName, style: theme.textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 140 + selectedProducts.length * colWidth,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  border: TableBorder.all(
                    color: Colors.grey.shade300,
                    width: 0.7,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    0: FixedColumnWidth(125),
                    for (int i = 1; i <= selectedProducts.length; i++)
                      i: FixedColumnWidth(colWidth),
                  },
                  children: [
                    // Header Row (Feature + Products)
                    TableRow(
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withAlpha(
                          (0.13 * 255).toInt(),
                        ),
                      ),
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          alignment: Alignment.center,
                          child: Text(
                            "Feature",
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ...selectedProducts.map((p) {
                          return Container(
                            padding: const EdgeInsets.all(12),
                            alignment: Alignment.center,
                            child: Text(
                              p['Item_Name'] ?? p['name'] ?? "-",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          child: Text(
                            "Images",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ...selectedProducts.map((p) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            alignment: Alignment.center,
                            child: ComparisonCarouselImage(
                              imageUrls: extractImages(p),
                            ),
                          );
                        }),
                      ],
                    ),
                    ...features.map((f) {
                      return TableRow(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 9,
                              horizontal: 8,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              beautify(f),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ...selectedProducts.map((p) {
                            final val = p[f];
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 7,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                val?.toString() ?? '-',
                                style: const TextStyle(fontSize: 13),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }),
                        ],
                      );
                    }),
                    if (onRemove != null)
                      TableRow(
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withAlpha(
                            (0.07 * 255).toInt(),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Actions",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ...selectedProducts.asMap().entries.map((entry) {
                            final idx = entry.key;
                            return Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.red,
                                  size: 26,
                                ),
                                tooltip: "Remove",
                                onPressed: () => onRemove!(idx),
                              ),
                            );
                          }),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
