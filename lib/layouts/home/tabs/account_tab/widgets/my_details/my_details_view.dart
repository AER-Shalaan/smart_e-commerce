import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_details/widgtes/my_details_body.dart';

import '../../../../../../core/utils/text_styles.dart';

class MyDetailsView extends StatelessWidget {
  const MyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 33),
        centerTitle: true,
        title: Text(
          "MyDetails",
          style: TextStyles.headlineStyle.copyWith(fontSize: 24),
        ),
      ),
      body: const MyDetailsBody(),
    );
  }
}
