import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/checkout_view_body.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/providers/parameters_payment_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/view_model/payment_view_model.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String token = arguments['token'] as String;
    final String userId = arguments['userId'] as String;
    final List<CartModel> cartItems = arguments['cartItems'] as List<CartModel>;
    final double total = arguments['total'] as double;
    var theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<PaymentViewModel>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(size: 33),
          title: Text("Checkout", style: theme.textTheme.titleMedium),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ChangeNotifierProvider(
                  create: (context) => ParametersPaymentProvider(),
                  child: CheckoutViewBody(
                    token: token,
                    userId: userId,
                    cartItems: cartItems,
                    total: total,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
