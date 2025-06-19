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
          icon: Icon(Icons.clear, color: Theme.of(context).colorScheme.primary),
        ),
      ),
    ];
  }

  @override
  TextStyle? get searchFieldStyle => const TextStyle(fontSize: 18);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final baseTheme = Theme.of(context);

    return baseTheme.copyWith(
      appBarTheme: baseTheme.appBarTheme.copyWith(
        backgroundColor: Colors.black54,
        surfaceTintColor: baseTheme.colorScheme.surfaceTint,
        toolbarTextStyle: baseTheme.textTheme.bodyMedium?.copyWith(
          fontSize: 18,
        ),
      ),
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        hintStyle: baseTheme.textTheme.labelSmall?.copyWith(
          color:
              baseTheme.brightness == Brightness.dark
                  ? Colors.white60
                  : Colors.black45,
        ),
        border: InputBorder.none,
      ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchBody(token: token, userId: userId);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Trigger the search on each change
    if (query.isNotEmpty) {
      SearchTabViewModel.getObject(
        context,
      ).search(query: query, page: 1, token: token, userId: userId);
      return SearchBody(token: token, userId: userId);
    }

    return Center(
      child: Text(
        'Search for a movie or tv series',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
