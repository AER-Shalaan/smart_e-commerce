import 'package:flutter/material.dart';

class AddressBookView extends StatelessWidget {
  const AddressBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 33),
        centerTitle: true,
        title: const Text("AddressBook"),
      ),
      body: const Placeholder(),
    );
  }
}
