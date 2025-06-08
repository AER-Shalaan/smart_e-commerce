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
import '../data/data_source/home/cart_tap_data_source/add_to_cart_data_source.dart'
    as _i928;
import '../data/data_source/home/cart_tap_data_source/get_cart_data_source.dart'
    as _i262;
import '../data/data_source/home/chat_bot_data_source/chat_bot_data_source.dart'
    as _i508;
import '../data/data_source/home/home_tap_data_source/best_seller_data_source.dart'
    as _i141;
import '../data/data_source/home/home_tap_data_source/categories_data_source.dart'
    as _i1050;
import '../data/data_source/home/home_tap_data_source/featured_product_data_source.dart'
    as _i27;
import '../data/data_source/home/home_tap_data_source/new_arrivals_data_source.dart'
    as _i354;
import '../data/data_source/home/home_tap_data_source/top_rated_data_source.dart'
    as _i359;
import '../data/data_source/home/product_details_data_source/product_details_data.dart'
    as _i688;
import '../data/data_source/login/login_data_source.dart' as _i153;
import '../data/data_source/signup/signup_data_source.dart' as _i125;
import '../data/data_source_impl/home/cart_tap_data_source_impl/add_tap_data_source_impl.dart'
    as _i530;
import '../data/data_source_impl/home/cart_tap_data_source_impl/get_cart_data_source_impl.dart'
    as _i114;
import '../data/data_source_impl/home/chat_bot_data_source_impl/chat_bot_data_source_impl.dart'
    as _i706;
import '../data/data_source_impl/home/home_tap_data_source_impl/categories_data_source_impl.dart'
    as _i323;
import '../data/data_source_impl/home/home_tap_data_source_impl/featured_product_data_source_impl.dart'
    as _i52;
import '../data/data_source_impl/home/home_tap_data_source_impl/most_selling_data_source_impl.dart'
    as _i543;
import '../data/data_source_impl/home/home_tap_data_source_impl/new_arrivals_data_source_impl.dart'
    as _i765;
import '../data/data_source_impl/home/home_tap_data_source_impl/top_rated_data_source_impl.dart'
    as _i22;
import '../data/data_source_impl/home/product_details_data_source_impl/product_details_data_source.dart'
    as _i489;
import '../data/data_source_impl/login/login_data_source_impl.dart' as _i335;
import '../data/data_source_impl/signup/sign_up_data_source_impl.dart' as _i764;
import '../layouts/authentication/login/view_model/login_view_model.dart'
    as _i857;
import '../layouts/authentication/signup/view_model/sign_up_view_model.dart'
    as _i55;
import '../layouts/chat_bot/view_model/chat_bot_view_model.dart' as _i200;
import '../layouts/home/layouts/product_details/veiw_model/add_to_cart_view_model/add_to_cart_view_model.dart'
    as _i242;
import '../layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart'
    as _i869;
import '../layouts/home/tabs/cart_tab/view_model/get_cart_view_model.dart'
    as _i153;
import '../layouts/home/tabs/home_tab/widgets/categorys/model_view/categories_view_model.dart'
    as _i579;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i108.ApiManger>(() => _i108.ApiManger());
    gh.factory<_i27.FeaturedProductDataSource>(
      () => _i52.FeaturedProductDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i508.ChatBotDataSource>(
      () => _i706.ChatBotDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i688.ProductDetailsDataSource>(
      () => _i489.ProductDetailsDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i141.BestSellerDataSource>(
      () => _i543.MostSellingDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i1050.CategoriesDataSource>(
      () => _i323.CategoriesDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i125.SignUpDataSource>(
      () => _i764.SignUpDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i354.NewArrivalsDataSource>(
      () => _i765.NewArrivalsDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i359.TopRatedDataSource>(
      () => _i22.TopRatedDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i153.LoginDataSource>(
      () => _i335.LoginDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i262.GetCartDataSource>(
      () => _i114.GetCartDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i928.AddToCartDataSource>(
      () => _i530.AddTapDataSourceImpl(gh<_i108.ApiManger>()),
    );
    gh.factory<_i200.ChatBotViewModel>(
      () => _i200.ChatBotViewModel(gh<_i508.ChatBotDataSource>()),
    );
    gh.factory<_i579.CategoriesViewModel>(
      () => _i579.CategoriesViewModel(gh<_i1050.CategoriesDataSource>()),
    );
    gh.factory<_i242.AddToCartViewModel>(
      () => _i242.AddToCartViewModel(gh<_i928.AddToCartDataSource>()),
    );
    gh.factory<_i857.LoginViewModel>(
      () => _i857.LoginViewModel(gh<_i153.LoginDataSource>()),
    );
    gh.factory<_i55.SignUpViewModel>(
      () => _i55.SignUpViewModel(gh<_i125.SignUpDataSource>()),
    );
    gh.factory<_i869.ProductDetailsViewModel>(
      () => _i869.ProductDetailsViewModel(gh<_i688.ProductDetailsDataSource>()),
    );
    gh.factory<_i153.GetCartViewModel>(
      () => _i153.GetCartViewModel(gh<_i262.GetCartDataSource>()),
    );
    return this;
  }
}
