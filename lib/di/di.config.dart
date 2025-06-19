// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../core/resuebale_componants/item_widget/view_model/add_item_view_view_model.dart'
    as _i1024;
import '../data/data_source/ai_check_data_source/ai_check_data_source.dart'
    as _i608;
import '../data/data_source/home/account_tab_data_source/profile_data_source/profile_data_source.dart'
    as _i439;
import '../data/data_source/home/cart_tap_data_source/add_to_cart_data_source.dart'
    as _i928;
import '../data/data_source/home/cart_tap_data_source/del_from_cart_data_source.dart'
    as _i298;
import '../data/data_source/home/cart_tap_data_source/get_cart_data_source.dart'
    as _i262;
import '../data/data_source/home/cart_tap_data_source/update_cart_data_source.dart'
    as _i233;
import '../data/data_source/home/chat_bot_data_source/chat_bot_data_source.dart'
    as _i508;
import '../data/data_source/home/comparison_tab_data_source/add_to_comparison_data_source.dart'
    as _i922;
import '../data/data_source/home/comparison_tab_data_source/comparison_data_source.dart'
    as _i941;
import '../data/data_source/home/home_tap_data_source/best_seller_data_source.dart'
    as _i141;
import '../data/data_source/home/home_tap_data_source/categories_data_source.dart'
    as _i1050;
import '../data/data_source/home/home_tap_data_source/featured_product_data_source.dart'
    as _i27;
import '../data/data_source/home/home_tap_data_source/new_arrivals_data_source.dart'
    as _i354;
import '../data/data_source/home/home_tap_data_source/recommended_list_data_souce.dart'
    as _i220;
import '../data/data_source/home/home_tap_data_source/search_data_source.dart'
    as _i1015;
import '../data/data_source/home/home_tap_data_source/subcategories_from_category_data_source.dart'
    as _i965;
import '../data/data_source/home/home_tap_data_source/top_rated_data_source.dart'
    as _i359;
import '../data/data_source/home/product_details_data_source/add_item_view_data_source.dart'
    as _i999;
import '../data/data_source/home/product_details_data_source/product_details_data.dart'
    as _i688;
import '../data/data_source/home/product_details_data_source/reviews_data_sources/add_review_data_source.dart'
    as _i143;
import '../data/data_source/home/product_details_data_source/reviews_data_sources/reviews_data_source.dart'
    as _i35;
import '../data/data_source/home/save_tab_data_source/add_itme_to_wishlsit_data_source.dart'
    as _i659;
import '../data/data_source/home/save_tab_data_source/del_itme_from_wishlsit_data_source.dart'
    as _i1065;
import '../data/data_source/home/save_tab_data_source/get_user_wishlist_data_source.dart'
    as _i585;
import '../data/data_source/login/login_data_source.dart' as _i153;
import '../data/data_source/signup/signup_data_source.dart' as _i125;
import '../data/data_source_impl/ai_check_data_source_impl/ai_check_data_source_impl.dart'
    as _i481;
import '../data/data_source_impl/home/cart_tap_data_source_impl/add_tap_data_source_impl.dart'
    as _i530;
import '../data/data_source_impl/home/cart_tap_data_source_impl/del_from_cart_data_source_impl.dart'
    as _i546;
import '../data/data_source_impl/home/cart_tap_data_source_impl/get_cart_data_source_impl.dart'
    as _i114;
import '../data/data_source_impl/home/cart_tap_data_source_impl/update_cart_data_source_impl.dart'
    as _i140;
import '../data/data_source_impl/home/chat_bot_data_source_impl/chat_bot_data_source_impl.dart'
    as _i706;
import '../data/data_source_impl/home/comparison_tab_data_source_impl/add_to_comparison_data_source_impl.dart'
    as _i1022;
import '../data/data_source_impl/home/comparison_tab_data_source_impl/comparison_data_source_impl.dart'
    as _i996;
import '../data/data_source_impl/home/home_tap_data_source_impl/categories_data_source_impl.dart'
    as _i323;
import '../data/data_source_impl/home/home_tap_data_source_impl/featured_product_data_source_impl.dart'
    as _i52;
import '../data/data_source_impl/home/home_tap_data_source_impl/most_selling_data_source_impl.dart'
    as _i543;
import '../data/data_source_impl/home/home_tap_data_source_impl/new_arrivals_data_source_impl.dart'
    as _i765;
import '../data/data_source_impl/home/home_tap_data_source_impl/recommended_list_data_source_impl.dart'
    as _i396;
import '../data/data_source_impl/home/home_tap_data_source_impl/search_data_source_impl.dart'
    as _i347;
import '../data/data_source_impl/home/home_tap_data_source_impl/subcategories_from_category_data_source_impl.dart'
    as _i879;
import '../data/data_source_impl/home/home_tap_data_source_impl/top_rated_data_source_impl.dart'
    as _i22;
import '../data/data_source_impl/home/product_details_data_source_impl/add_item_view_data_source_impl.dart'
    as _i646;
import '../data/data_source_impl/home/product_details_data_source_impl/product_details_data_source.dart'
    as _i489;
import '../data/data_source_impl/home/product_details_data_source_impl/reviews_data_sources_impls/add_review_data_source_impl.dart'
    as _i675;
import '../data/data_source_impl/home/product_details_data_source_impl/reviews_data_sources_impls/reviews_data_source_impl.dart'
    as _i579;
import '../data/data_source_impl/home/profile_data_source_impl/profile_data_source_impl.dart'
    as _i731;
import '../data/data_source_impl/home/save_tab_data_source_impl/add_product_to_wishlist_data_source_impl.dart'
    as _i474;
import '../data/data_source_impl/home/save_tab_data_source_impl/del_product_from_wishlist_data_source_impl.dart'
    as _i752;
import '../data/data_source_impl/home/save_tab_data_source_impl/get_user_wishlist_data_source_impl.dart'
    as _i492;
import '../data/data_source_impl/login/login_data_source_impl.dart' as _i335;
import '../data/data_source_impl/signup/sign_up_data_source_impl.dart' as _i764;
import '../layouts/authentication/login/view_model/login_view_model.dart'
    as _i857;
import '../layouts/authentication/signup/view_model/sign_up_view_model.dart'
    as _i55;
import '../layouts/chat_bot/view_model/chat_bot_view_model.dart' as _i200;
import '../layouts/home/layouts/product_details/veiw_model/add_review_view_model/add_review_view_model.dart'
    as _i509;
import '../layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model.dart'
    as _i242;
import '../layouts/home/layouts/product_details/veiw_model/add_to_comparison_view_model/add_to_comparison_view_model.dart'
    as _i850;
import '../layouts/home/layouts/product_details/veiw_model/add_to_wishlist_view_model/add_to_wishlist_view_model.dart'
    as _i676;
import '../layouts/home/layouts/product_details/veiw_model/check_review_view_model/check_review_view_model.dart'
    as _i228;
import '../layouts/home/layouts/product_details/veiw_model/get_reviews_view_model/get_reviews_view_model.dart'
    as _i1035;
import '../layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart'
    as _i869;
import '../layouts/home/tabs/account_tab/widgets/my_details/view_model/profile_view_model.dart'
    as _i278;
import '../layouts/home/tabs/cart_tab/view_model/del_item_from_cart_view_model/del_item_from_cart_view_model.dart'
    as _i571;
import '../layouts/home/tabs/cart_tab/view_model/get_cart_view_model/get_cart_view_model.dart'
    as _i579;
import '../layouts/home/tabs/cart_tab/view_model/update_cart_view_model/update_cart_view_model.dart'
    as _i605;
import '../layouts/home/tabs/comparison_tab/view_model/comparison_view_model.dart'
    as _i713;
import '../layouts/home/tabs/home_tab/search_feature/view_model/search_view_model.dart'
    as _i980;
import '../layouts/home/tabs/home_tab/widgets/categorys/view_model/home_categories_view_model.dart'
    as _i573;
import '../layouts/home/tabs/home_tab/widgets/filter/model_view/categories_view_model/categories_view_model.dart'
    as _i172;
import '../layouts/home/tabs/home_tab/widgets/filter/model_view/subcategories_from_category_view_model/subcategories_from_category_view_model.dart'
    as _i816;
import '../layouts/home/tabs/home_tab/widgets/recommended/view_model/recommended_cubit.dart'
    as _i124;
import '../layouts/home/tabs/saved_tab/view_model/del_Item_from_wishlist/del_item_form_wishlist_view_model.dart'
    as _i669;
import '../layouts/home/tabs/saved_tab/view_model/get_user_wishlist/get_user_wishlist_view_model.dart'
    as _i774;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i108.ApiManger>(() => _i108.ApiManger());
    gh.factory<_i27.FeaturedProductDataSource>(
        () => _i52.FeaturedProductDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i922.AddToComparisonDataSource>(
        () => _i1022.AddToComparisonDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i585.GetUserWishlistDataSource>(
        () => _i492.GetUserWishlistDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i850.AddToComparisonViewModel>(() =>
        _i850.AddToComparisonViewModel(gh<_i922.AddToComparisonDataSource>()));
    gh.factory<_i143.AddReviewDataSource>(
        () => _i675.AddReviewDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i508.ChatBotDataSource>(
        () => _i706.ChatBotDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i688.ProductDetailsDataSource>(
        () => _i489.ProductDetailsDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i298.DelFromCartDataSource>(
        () => _i546.DelFromCartDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i35.ReviewsDataSource>(
        () => _i579.ReviewsDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i941.ComparisonDataSource>(
        () => _i996.ComparisonDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i659.AddItmeToWishlistDataSource>(
        () => _i474.AddProductToWishlistDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i141.BestSellerDataSource>(
        () => _i543.MostSellingDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i1050.CategoriesDataSource>(
        () => _i323.CategoriesDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i125.SignUpDataSource>(
        () => _i764.SignUpDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i1015.SearchDataSource>(
        () => _i347.SearchDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i220.RecommendedListDataSource>(
        () => _i396.RecommendedListDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i354.NewArrivalsDataSource>(
        () => _i765.NewArrivalsDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i999.AddItemViewDataSource>(
        () => _i646.AddItemViewDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i608.AICheckDataSource>(
        () => _i481.AiCheckDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i571.DelItemFromCartViewModel>(() =>
        _i571.DelItemFromCartViewModel(gh<_i298.DelFromCartDataSource>()));
    gh.factory<_i359.TopRatedDataSource>(
        () => _i22.TopRatedDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i233.UpdateCartDataSource>(
        () => _i140.UpdateCartDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i153.LoginDataSource>(
        () => _i335.LoginDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i965.SubcategoriesFromCategoryDataSource>(() =>
        _i879.SubcategoriesFromCategoryDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i262.GetCartDataSource>(
        () => _i114.GetCartDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i928.AddToCartDataSource>(
        () => _i530.AddTapDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i1065.DelItmeFromWishlsitDataSource>(() =>
        _i752.DelProductFromWishlistDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i439.ProfileDataSource>(
        () => _i731.ProfileDataSourceImpl(gh<_i108.ApiManger>()));
    gh.factory<_i200.ChatBotViewModel>(
        () => _i200.ChatBotViewModel(gh<_i508.ChatBotDataSource>()));
    gh.factory<_i573.HomeCategoriesViewModel>(
        () => _i573.HomeCategoriesViewModel(gh<_i1050.CategoriesDataSource>()));
    gh.factory<_i172.CategoriesViewModel>(
        () => _i172.CategoriesViewModel(gh<_i1050.CategoriesDataSource>()));
    gh.factory<_i1035.GetReviewsViewModel>(
        () => _i1035.GetReviewsViewModel(gh<_i35.ReviewsDataSource>()));
    gh.factory<_i669.DelItemFormWishlistViewModel>(() =>
        _i669.DelItemFormWishlistViewModel(
            gh<_i1065.DelItmeFromWishlsitDataSource>()));
    gh.factory<_i242.AddToCartViewModel>(
        () => _i242.AddToCartViewModel(gh<_i928.AddToCartDataSource>()));
    gh.factory<_i509.AddReviewViewModel>(
        () => _i509.AddReviewViewModel(gh<_i143.AddReviewDataSource>()));
    gh.factory<_i124.RecommendedProductsCubit>(() =>
        _i124.RecommendedProductsCubit(gh<_i220.RecommendedListDataSource>()));
    gh.factory<_i980.SearchTabViewModel>(
        () => _i980.SearchTabViewModel(gh<_i1015.SearchDataSource>()));
    gh.factory<_i857.LoginViewModel>(
        () => _i857.LoginViewModel(gh<_i153.LoginDataSource>()));
    gh.factory<_i228.CheckReviewViewModel>(
        () => _i228.CheckReviewViewModel(gh<_i608.AICheckDataSource>()));
    gh.factory<_i713.ComparisonViewModel>(
        () => _i713.ComparisonViewModel(gh<_i941.ComparisonDataSource>()));
    gh.factory<_i55.SignUpViewModel>(
        () => _i55.SignUpViewModel(gh<_i125.SignUpDataSource>()));
    gh.factory<_i278.ProfileViewModel>(
        () => _i278.ProfileViewModel(gh<_i439.ProfileDataSource>()));
    gh.factory<_i774.GetUserWishlistViewModel>(() =>
        _i774.GetUserWishlistViewModel(gh<_i585.GetUserWishlistDataSource>()));
    gh.factory<_i605.UpdateCartViewModel>(
        () => _i605.UpdateCartViewModel(gh<_i233.UpdateCartDataSource>()));
    gh.factory<_i869.ProductDetailsViewModel>(() =>
        _i869.ProductDetailsViewModel(gh<_i688.ProductDetailsDataSource>()));
    gh.factory<_i676.AddToWishlistViewModel>(() =>
        _i676.AddToWishlistViewModel(gh<_i659.AddItmeToWishlistDataSource>()));
    gh.factory<_i816.SubcategoriesFromCategoryViewModel>(() =>
        _i816.SubcategoriesFromCategoryViewModel(
            gh<_i965.SubcategoriesFromCategoryDataSource>()));
    gh.factory<_i579.GetCartViewModel>(
        () => _i579.GetCartViewModel(gh<_i262.GetCartDataSource>()));
    gh.factory<_i1024.AddItemViewViewModel>(
        () => _i1024.AddItemViewViewModel(gh<_i999.AddItemViewDataSource>()));
    return this;
  }
}
