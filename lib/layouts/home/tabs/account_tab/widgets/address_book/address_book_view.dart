import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/add_address_view_model/add_address_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/widgets/address_book_body.dart';

class AddressBookView extends StatelessWidget {
  const AddressBookView({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final token = arguments[0] as String;
    final userId = arguments[1] as String;
    final bool forSelection =
        arguments.length > 2 ? arguments[2] as bool : false;
    final theme = Theme.of(context);
    log(userId);
    return BlocProvider(
      create: (context) => getIt<AddAddressCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(size: 33),
          centerTitle: true,
          title: Text("AddressBook", style: theme.textTheme.titleMedium),
        ),
        body: AddressBookBody(
          token: token,
          userId: userId,
          onSelect:
              forSelection
                  ? (selectedAddress) {
                    Navigator.pop(context, selectedAddress);
                  }
                  : null,
        ),
      ),
    );
  }
}
