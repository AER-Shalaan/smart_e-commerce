import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/provider/wishlist_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/view_model/del_Item_from_wishlist/del_item_form_wishlist_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/view_model/get_user_wishlist/get_user_wishlist_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/view_model/get_user_wishlist/get_user_wishlist_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/widgets/build_sved_item.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({super.key, required this.token, required this.userId});
  final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
        var provider = Provider.of<WishlistProvider>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  getIt<GetUserWishlistViewModel>()
                    ..getUserWishlist(token: token, userId: userId),
        ),
        BlocProvider(create: (context) => getIt<DelItemFormWishlistViewModel>()),
      ],
      child: BlocBuilder<GetUserWishlistViewModel, GetUserWishlistStates>(
        builder: (context, state) {
          if (state is GetUserWishlistSuccessState) {
            if (state.wishlist.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.heart_broken_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Your wishlist is empty!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Add items to your wishlist to get started.",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              );
            } else {
              provider.wishlist = state.wishlist;
              return SavedItemWidgetBuilder(
                token: token,
                userId: userId,
                productsList: state.wishlist,
              );
            }
          }
          if (state is GetUserWishlistErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AppSnackBar.show(
                context: context,
                message: state.message.message,
                icon: Icons.error_outline,
                backgroundColor: Colors.redAccent,
                fromTop: false,
              );
            });

            return Center(
              child: Text(
                "Failed to load wishlist.",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }
          return Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
