import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/resuebale_componants/carousel_image.dart';
import '../cubit/comparison_cubit.dart';
import '../cubit/comparison_states.dart';

class ComparisonTable extends StatelessWidget {
  final List<Map<String, dynamic>> selectedProducts;

  const ComparisonTable({super.key, required this.selectedProducts});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minTableWidth = screenWidth * 0.9;
    double columnWidth = screenWidth * 0.4;

    Set<String> allFeatures = {};
    for (var product in selectedProducts) {
      allFeatures.addAll(product.keys);
    }
    allFeatures.remove('name');
    allFeatures.remove('imageUrls');

    return BlocBuilder<ComparisonCubit, ComparisonStates>(
      builder: (context, state) {
        final cubit = context.read<ComparisonCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Laptops Table"),
            backgroundColor: Colors.white,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  {
                    cubit.clearComparison();
                  }
                },
                icon: const Icon(Icons.clear_all, color: Colors.red),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: minTableWidth),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 15,
                    dataRowMinHeight: 60,
                    dataRowMaxHeight: 100,
                    clipBehavior: Clip.antiAlias,
                    headingRowColor: const WidgetStatePropertyAll(
                      Color(0xff0E947A),
                    ),
                    headingTextStyle: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    dataTextStyle: GoogleFonts.dmSans(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: TableBorder.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    columns: [
                      DataColumn(
                        label: SizedBox(
                          width: columnWidth * 0.8,
                          child: const Center(
                            child: Text(
                              'Feature',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ...selectedProducts.map(
                        (product) => DataColumn(
                          label: SizedBox(
                            width: columnWidth,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double screenWidth =
                                    MediaQuery.of(context).size.width;
                                bool isSmallScreen = screenWidth < 600;

                                return Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product['name'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: isSmallScreen ? 1 : 2,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      onPressed: () {
                                        cubit.removeFromComparison(product);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                    rows: _buildComparisonRows(
                      context,
                      allFeatures,
                      columnWidth,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<DataRow> _buildComparisonRows(
    BuildContext context,
    Set<String> allFeatures,
    double columnWidth,
  ) {
    List<DataRow> rows = [];

    rows.add(
      DataRow(
        cells: [
          const DataCell(
            Text(
              'Images',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          ...selectedProducts.map(
            (product) => DataCell(
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 120,
                    child: CarouselImage(imageUrls: product['imageUrls'] ?? []),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    for (var feature in allFeatures) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    feature,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ...selectedProducts.map(
              (product) => DataCell(
                Container(
                  constraints: BoxConstraints(
                    minWidth: columnWidth * 0.7,
                    maxWidth: columnWidth * 1.2,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                          (product[feature] is List)
                              ? (product[feature] as List<dynamic>)
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        '-$item',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList()
                              : [
                                Center(
                                  child: Text(
                                    product[feature]?.toString() ?? 'NA',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }
}
