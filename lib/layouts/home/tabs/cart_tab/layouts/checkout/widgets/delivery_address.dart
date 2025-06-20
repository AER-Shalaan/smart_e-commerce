import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/data/models/address_model/address.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/providers/parameters_payment_provider.dart';

class DeliveryAddress extends StatelessWidget {
  final String token;
  final String userId;

  const DeliveryAddress({
    super.key,
    required this.token,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var paymentProvider = Provider.of<ParametersPaymentProvider>(context);
    Address? selectedAddress = paymentProvider.selectedAddress;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Delivery Address", style: theme.textTheme.bodyLarge),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Text(
                "Change",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                  height: 1.5,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () async {
                final Address? address = await Navigator.pushNamed(
                  context,
                  Routes.addressBookViewRouteName,
                  arguments: [token, userId, true],
                ) as Address?;
                if (address != null) {
                  paymentProvider.setAddress(address.id, address); // عدلتها تحت في البروڤايدر
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on, color: theme.colorScheme.primary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: selectedAddress == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No Address Selected",
                          style: theme.textTheme.titleSmall,
                        ),
                        Text(
                          "Please select an address",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedAddress.firstName,
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${selectedAddress.building} ${selectedAddress.street}, '
                          '${selectedAddress.city}, ${selectedAddress.state}',
                        ),
                        Text(
                          'postal code: ${selectedAddress.postalCode}',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
