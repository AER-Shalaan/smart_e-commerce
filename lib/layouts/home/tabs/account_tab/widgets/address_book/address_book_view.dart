import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/address_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/widgets/address_book_body.dart';

class AddressBookView extends StatelessWidget {
  const AddressBookView({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final token = arguments[0] as String;
    final userId = arguments[1] as String;
    log(userId);
    return BlocProvider(
      create:
          (context) =>
              getIt<AddressViewModel>()
                ..fetchAddresses(token: token, userId: userId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(size: 33),
          centerTitle: true,
          title: const Text("AddressBook"),
        ),
        body: AddressBookBody(),
      ),
    );
  }
}
