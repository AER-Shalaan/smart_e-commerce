import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/data/models/address_model/address.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/get_addresses_view_model/address_state.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/get_addresses_view_model/address_view_model.dart';
import 'package:smart_ecommerce/config/shared_preferences.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/layouts/checkout/providers/parameters_payment_provider.dart';

class DeliveryAddress extends StatelessWidget {
  final String token;
  final String userId;

  const DeliveryAddress({super.key, required this.token, required this.userId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    context.select<AddressViewModel, bool>((vm) {
      if (vm.state is! AddressSuccess) {
        Future.microtask(() {
          vm.fetchAddresses(token: token, userId: userId);
        });
      }
      return true;
    });

    return BlocBuilder<AddressViewModel, AddressState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is AddressLoading || state is AddressInitial) {
          return Row(
            children: [
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text("Loading address...", style: textTheme.bodyMedium),
              ),
            ],
          );
        }

        if (state is AddressSuccess) {
          return _SelectedAddressDetails(state: state);
        }

        return Row(
          children: [
            Icon(Icons.error, color: Colors.red),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                "Error loading address!",
                style: textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SelectedAddressDetails extends StatelessWidget {
  final AddressSuccess state;

  const _SelectedAddressDetails({required this.state});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final paymentProvider = Provider.of<ParametersPaymentProvider>(
      context,
      listen: false,
    );

    return FutureBuilder<int?>(
      future: SharedPreferencesFunctions.getSelectedAddressId(),
      builder: (context, snapshot) {
        String addressTitle = 'No Address Selected';
        String addressDetails = '';

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            children: [
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text("Loading address...", style: textTheme.bodyMedium),
              ),
            ],
          );
        }

        final savedId = snapshot.data;
        Address? selectedAddress;

        if (savedId != null) {
          try {
            selectedAddress = state.addresses.firstWhere(
              (addr) => addr.id == savedId,
            );
            if (paymentProvider.addressId != savedId) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                paymentProvider.setAddress(savedId);
              });
            }
          } catch (_) {
            selectedAddress = null;
          }
        }

        if (selectedAddress != null) {
          addressTitle = "Current Address";
          addressDetails =
              "${selectedAddress.street} "
                      "${selectedAddress.city} "
                      "${selectedAddress.state} "
                      "${selectedAddress.postalCode}"
                  .trim();
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on, color: colorScheme.primary, size: 24),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addressTitle,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    addressDetails.isNotEmpty
                        ? addressDetails
                        : "Please select a delivery address.",
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme.onSurface.withAlpha(160),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
