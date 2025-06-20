import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/data/models/address_model/add_address_model/add_address_request_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/add_address_view_model/add_address_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/add_address_view_model/add_address_view_model.dart';

class AddAddressSection extends StatefulWidget {
  final String token;
  final String userId;
  final VoidCallback? onAddressAdded;
  final VoidCallback? onCancel;

  const AddAddressSection({
    super.key,
    required this.token,
    required this.userId,
    this.onAddressAdded,
    this.onCancel,
  });

  @override
  State<AddAddressSection> createState() => _AddAddressSectionState();
}

class _AddAddressSectionState extends State<AddAddressSection> {
  final _apartmentController = TextEditingController();
  final _floorController = TextEditingController();
  final _streetController = TextEditingController();
  final _buildingController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _waiting = false;

  @override
  void dispose() {
    _apartmentController.dispose();
    _floorController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  String? _digitsOnlyValidator(
    String? value, {
    int minLen = 1,
    int maxLen = 4,
  }) {
    if (value == null || value.trim().isEmpty) return 'Required';
    if (!RegExp(r'^\d+$').hasMatch(value.trim())) return 'Digits only';
    if (value.trim().length < minLen) return 'Too short';
    if (value.trim().length > maxLen) return 'Too long';
    return null;
  }

  String? _textFieldValidator(
    String? value, {
    int minLen = 2,
    int maxLen = 30,
  }) {
    if (value == null || value.trim().isEmpty) return 'Required';
    if (value.trim().length < minLen) return 'Too short';
    if (value.trim().length > maxLen) return 'Too long';
    if (!RegExp(r"^[a-zA-Z0-9\u0600-\u06FF\s]+$").hasMatch(value.trim())) {
      return 'Only letters, numbers, and spaces allowed';
    }
    return null;
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final address = AddAddressRequestModel(
      apartment: _apartmentController.text.trim(),
      floor: _floorController.text.trim(),
      street: _streetController.text.trim(),
      building: _buildingController.text.trim(),
      city: _cityController.text.trim(),
      state: _stateController.text.trim(),
    );

    context.read<AddAddressCubit>().addAddress(
      token: widget.token,
      userId: widget.userId,
      address: address,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        if (state is AddAddressLoading) {
          setState(() => _waiting = true);
        } else if (state is AddAddressFailure) {
          setState(() => _waiting = false);
          AppSnackBar.show(
            context: context,
            message: state.error,
            icon: Icons.error,
            backgroundColor: theme.colorScheme.error,
          );
        } else if (state is AddAddressSuccess) {
          setState(() => _waiting = false);
          AppSnackBar.show(
            context: context,
            message: "Address added successfully.",
            icon: Icons.check_circle,
            backgroundColor: Colors.green.shade600,
          );
          _apartmentController.clear();
          _floorController.clear();
          _streetController.clear();
          _buildingController.clear();
          _cityController.clear();
          _stateController.clear();

          if (widget.onAddressAdded != null) widget.onAddressAdded!();
        }
      },
      builder: (context, state) {
        return Center(
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            color: theme.cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Add New Address",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildTextField(
                      _apartmentController,
                      "Apartment",
                      theme,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      customValidator:
                          (value) =>
                              _digitsOnlyValidator(value, minLen: 1, maxLen: 4),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(
                      _floorController,
                      "Floor",
                      theme,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      customValidator:
                          (value) =>
                              _digitsOnlyValidator(value, minLen: 1, maxLen: 3),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(
                      _streetController,
                      "Street",
                      theme,
                      maxLength: 30,
                      customValidator:
                          (value) =>
                              _textFieldValidator(value, minLen: 2, maxLen: 30),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(
                      _buildingController,
                      "Building",
                      theme,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      customValidator:
                          (value) =>
                              _digitsOnlyValidator(value, minLen: 1, maxLen: 4),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(
                      _cityController,
                      "City",
                      theme,
                      maxLength: 20,
                      customValidator:
                          (value) =>
                              _textFieldValidator(value, minLen: 2, maxLen: 20),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(
                      _stateController,
                      "State",
                      theme,
                      maxLength: 20,
                      customValidator:
                          (value) =>
                              _textFieldValidator(value, minLen: 2, maxLen: 20),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _waiting ? null : _onSubmit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 1,
                            ),
                            child:
                                _waiting
                                    ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.3,
                                        color: Colors.white,
                                      ),
                                    )
                                    : Text(
                                      "Add Address",
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                    ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed:
                                _waiting
                                    ? null
                                    : () {
                                      if (widget.onCancel != null) {
                                        widget.onCancel!();
                                      }
                                    },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: theme.colorScheme.error,
                              side: BorderSide(color: theme.colorScheme.error),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Cancel",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.error,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    ThemeData theme, {
    TextInputType? keyboardType,
    String? Function(String?)? customValidator,
    int? maxLength,
  }) {
    return TextFormField(
      controller: controller,
      validator: customValidator,
      enabled: !_waiting,
      style: theme.textTheme.bodyMedium,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: theme.textTheme.bodyMedium,
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        contentPadding: const EdgeInsets.all(12),
        counterText: "",
      ),
    );
  }
}
