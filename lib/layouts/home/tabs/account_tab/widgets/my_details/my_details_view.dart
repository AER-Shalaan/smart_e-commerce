import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_details/view_model/profile_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_details/widgtes/my_details_body.dart';

class MyDetailsView extends StatelessWidget {
  const MyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final token = arguments[0] as String;
    final userId = arguments[1] as String;
    return BlocProvider(
      create:
          (context) =>
              getIt<ProfileViewModel>()
                ..getProfile(token: token, userId: userId),

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(size: 33),
          centerTitle: true,
          title: Text(
            "My Details",
            style: theme.textTheme.titleMedium
          ),
        ),
        body: MyDetailsBody(),
      ),
    );
  }
}
