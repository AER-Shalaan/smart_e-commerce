import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/search_feature/view_model/search_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/search_feature/widgets/search_body.dart';

class SearchScreen extends SearchDelegate {
  SearchScreen({required this.token, required this.userId});
  final String token, userId;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: Icon(
            Icons.clear,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          tooltip: 'delete',
        ),
      ),
    ];
  }

  @override
  TextStyle? get searchFieldStyle => null;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);

    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: theme.colorScheme.surface.withAlpha(
          242,
        ), // شفافية بسيطة
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: theme.colorScheme.primary, size: 28),
        titleTextStyle: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        toolbarTextStyle: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 18,
          color: theme.colorScheme.onSurface,
        ),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: theme.colorScheme.surface.withAlpha(235),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color:
              theme.brightness == Brightness.dark
                  ? Colors.white60
                  : Colors.black54,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.7),
        ),
      ),
      textSelectionTheme: theme.textSelectionTheme.copyWith(
        cursorColor: theme.colorScheme.primary,
      ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Theme.of(context).colorScheme.primary,
        size: 24,
      ),
      tooltip: 'back',
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchBody(token: token, userId: userId);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      SearchTabViewModel.getObject(
        context,
      ).search(query: query, page: 1, token: token, userId: userId);
      return SearchBody(token: token, userId: userId);
    }

    return Center(
      child: Text(
        "search for products",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
