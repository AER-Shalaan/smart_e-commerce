import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/address_state.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/address_view_model.dart';

class AddressBookBody extends StatelessWidget {
  const AddressBookBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<AddressViewModel, AddressState>(
      builder: (context, state) {
        if (state is AddressLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AddressFailure) {
          return Center(child: Text(state.message));
        } else if (state is AddressSuccess) {
          final addresses = state.addresses;
          final selectedId = state.selectedAddressId;
          if (addresses.isEmpty) {
            return const Center(child: Text("No addresses found."));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final address = addresses[index];
              final isSelected = address.id == selectedId;
              return GestureDetector(
                onTap: () {
                  context.read<AddressViewModel>().selectAddress(
                    address.id,
                    addresses,
                  );
                },
                child: Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    side:
                        isSelected
                            ? BorderSide(
                              color: theme.colorScheme.primary,
                              width: 2,
                            )
                            : BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color:
                      isSelected
                          ? theme.colorScheme.primary.withAlpha(30)
                          : theme.cardColor,
                  child: ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color:
                          isSelected
                              ? theme.colorScheme.primary
                              : theme.iconTheme.color,
                    ),
                    title: Text(
                      address.firstName,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSecondary,
                      ),
                    ),
                    subtitle: Text(
                      "${address.street}, ${address.city}, ${address.state}",
                    ),
                    trailing: Text(
                      "${address.country} - ${address.postalCode}",
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
