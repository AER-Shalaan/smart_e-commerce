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

import '../core/api/api_manger.dart' as _i993;
import '../data/data_source/home/home_tap_data_source/top_rated_data_source.dart'
    as _i359;
import '../data/data_source/home/product_details_data_source/product_details_data.dart'
    as _i688;
import '../data/data_source/login/login_data_source.dart' as _i153;
import '../data/data_source/signup/signup_data_source.dart' as _i125;
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
import '../layouts/home/layouts/product_details/veiw_model/product_details_view_model.dart'
    as _i869;
import '../layouts/home/tabs/home_tab/widgets/top_rated_product/view_model/top_rated_view_model.dart'
    as _i409;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i993.ApiManger>(() => _i993.ApiManger());
    gh.factory<_i125.SignUpDataSource>(
      () => _i764.SignUpDataSourceImpl(gh<_i993.ApiManger>()),
    );
    gh.factory<_i153.LoginDataSource>(
      () => _i335.LoginDataSourceImpl(gh<_i993.ApiManger>()),
    );
    gh.factory<_i359.TopRatedDataSource>(
      () => _i22.TopRatedDataSourceImpl(gh<_i993.ApiManger>()),
    );
    gh.factory<_i688.ProductDetailsDataSource>(
      () => _i489.ProductDetailsDataSourceImpl(gh<_i993.ApiManger>()),
    );
    gh.factory<_i409.TopRatedViewModel>(
      () => _i409.TopRatedViewModel(gh<_i359.TopRatedDataSource>()),
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
    return this;
  }
}
