import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/provider/add_cart_provider.dart';
import '../../di/di.dart';
import '../../layouts/authentication/logIn/login_view.dart';
import '../../layouts/authentication/login/view_model/login_view_model.dart';
import '../../layouts/authentication/resetPassFeature/OTP/otp.dart';
import '../../layouts/authentication/resetPassFeature/Provider/forgot_password_provider.dart';
import '../../layouts/authentication/resetPassFeature/Provider/reset_password_provider.dart';
import '../../layouts/authentication/resetPassFeature/forgot_password/forgot_password.dart';
import '../../layouts/authentication/resetPassFeature/reset_password/reset_password.dart';
import '../../layouts/authentication/signUp/sign_up_view.dart';
import '../../layouts/authentication/signup/view_model/sign_up_view_model.dart';
import '../../layouts/home/layouts/product_details/view/products_details_view.dart';
import '../../layouts/home/provider/home_provider.dart';
import '../../layouts/home/tabs/account_tab/widgets/FAQs/Providers/faq_provider.dart';
import '../../layouts/home/tabs/account_tab/widgets/FAQs/f_a_qs_view.dart';
import '../../layouts/home/tabs/account_tab/widgets/address_book/address_book_view.dart';
import '../../layouts/home/tabs/account_tab/widgets/help_center/help_center_view.dart';
import '../../layouts/home/tabs/account_tab/widgets/my_details/my_details_view.dart';
import '../../layouts/home/tabs/account_tab/widgets/my_orders/my_orders_view.dart';
import '../../layouts/home/tabs/account_tab/widgets/notifications/notifications_view.dart';
import '../../layouts/home/tabs/account_tab/widgets/payment_methods/paymentMethodsView.dart';
import '../../layouts/home/widgets/ui_layout_builder.dart';
import '../../layouts/onBording/onBording_view.dart';
import '../../layouts/splash/splash_view.dart';

class Routes {
  static const String splashRouteName = "splash";
  static const String onBoardingRouteName = "onBoarding";
  static const String signUpViewRouteName = "SignUpView";
  static const String loginViewRouteName = "LoginView";
  static const String forgotPasswordRouteName = "ForgotPassword";
  static const String otpRouteName = "Otp";
  static const String resetPasswordRouteName = "ResetPassword";
  static const String homeView = "homeView";
  static const String productDetailsView = "productDetailsView";
  static const String addressBookViewRouteName = "addressBookView";
  static const String fAQsViewRouteName = "fAQsView";
  static const String helpCenterViewRouteName = "helpCenterView";
  static const String myDetailsViewRouteName = "myDetailsView";
  static const String myOrdersViewRouteName = "myOrdersView";
  static const String notificationsViewRouteName = "NotificationsView";
  static const String paymentMethodsViewRouteName = "PaymentMethodsView";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      splashRouteName: (_) => const SplashView(),
      onBoardingRouteName: (_) => const OnBoardingView(),
      forgotPasswordRouteName:
          (_) => ChangeNotifierProvider(
            create: (_) => ForgotPasswordProvider(),
            child: ForgotPassword(),
          ),
      otpRouteName: (_) => const Otp(email: ''),
      resetPasswordRouteName:
          (_) => ChangeNotifierProvider(
            create: (_) => ResetPasswordProvider(),
            child: ResetPassword(),
          ),
      homeView:
          (_) => ChangeNotifierProvider(
            create: (_) => HomeProvider(),
            child: const UiLayoutBuilder(),
          ),
      loginViewRouteName:
          (_) => BlocProvider(
            create: (_) => getIt<LoginViewModel>(),
            child: const LoginView(),
          ),
      signUpViewRouteName:
          (_) => BlocProvider(
            create: (_) => getIt<SignUpViewModel>(),
            child: const SignUpView(),
          ),
      productDetailsView:
          (_) => ChangeNotifierProvider(
            create: (_) => AddCartProvider(),
            child: const ProductsDetailsView(),
          ),
      addressBookViewRouteName: (_) => const AddressBookView(),
      fAQsViewRouteName:
          (_) => ChangeNotifierProvider(
            create: (context) => FAQProvider(),
            child: const FAQsView(),
          ),
      helpCenterViewRouteName: (_) => const HelpCenterView(),
      myDetailsViewRouteName: (_) => const MyDetailsView(),
      myOrdersViewRouteName: (_) => const MyOrdersView(),
      notificationsViewRouteName: (_) => const NotificationsView(),
      paymentMethodsViewRouteName: (_) => const PaymentMethodsView(),
    };
  }
}
