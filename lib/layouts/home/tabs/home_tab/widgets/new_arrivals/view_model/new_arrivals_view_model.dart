import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/new_arrivals_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/new_arrivals/view_model/new_arrivals_view_model_states.dart';

@injectable
class NewArrivalsViewModel extends Cubit<NewArrivalsViewModelStates> {
  NewArrivalsViewModel(this.newArrivalsModel) : super(NewArrivalsInitialState());
  @factoryMethod
  final NewArrivalsDataSource newArrivalsModel;
  static NewArrivalsViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getNewArrivals({required String token}) async {
    emit(NewArrivalsLoadingState());
    await newArrivalsModel
        .getNewArrivals(token: token)
        .then(
          (value) => value.fold(
            (failure) => emit(NewArrivalsErrorState(failure.message)),
            (productList) => emit(NewArrivalsSuccessState(productList)),
            
          ),
        );
  }
}
