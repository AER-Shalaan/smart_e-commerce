import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/get_addresses_view_model/address_state.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/get_addresses_view_model/address_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/widgets/add_address_section.dart';

class AddressBookBody extends StatefulWidget {
  final String token;
  final String userId;
  const AddressBookBody({
    super.key,
    required this.token,
    required this.userId,
  });

  @override
  State<AddressBookBody> createState() => _AddressBookBodyState();
}

class _AddressBookBodyState extends State<AddressBookBody> {
  bool showAddAddressSection = false;
  bool _isLoaded = false;

  void handleAddressAdded() {
    setState(() => showAddAddressSection = false);
    context.read<AddressViewModel>().fetchAddresses(
      token: widget.token,
      userId: widget.userId,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isLoaded) {
        context.read<AddressViewModel>().fetchAddresses(
          token: widget.token,
          userId: widget.userId,
        );
        _isLoaded = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Flexible(
          child: SizedBox(
            height: screenHeight * 0.60,
            child: BlocBuilder<AddressViewModel, AddressState>(
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
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
                          margin: const EdgeInsets.only(bottom: 8),
                          shape: RoundedRectangleBorder(
                            side: isSelected
                                ? BorderSide(
                                    color: theme.colorScheme.primary,
                                    width: 2,
                                  )
                                : BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: isSelected
                              ? theme.colorScheme.primary.withAlpha(30)
                              : theme.cardColor,
                          child: ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : theme.iconTheme.color,
                            ),
                            title: Text(
                              address.firstName,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSelected
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
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            bottom: 10,
            top: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!showAddAddressSection)
                ElevatedButton.icon(
                  icon: const Icon(Icons.add_location_alt_rounded),
                  label: const Text("Add New Address"),
                  onPressed: () {
                    setState(() {
                      showAddAddressSection = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              if (showAddAddressSection)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: AddAddressSection(
                    token: widget.token,
                    userId: widget.userId,
                    onAddressAdded: handleAddressAdded,
                    onCancel:
                        () => setState(() => showAddAddressSection = false),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
