import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/add_item_view_model.dart';

abstract class AddItemViewStates {}

class AddItemViewInitialState extends AddItemViewStates {}

class AddItemViewLoadingState extends AddItemViewStates {}

class AddItemViewSuccessState extends AddItemViewStates {
  final AddItemViewModel response;
AddItemViewSuccessState(this.response);

}

class AddItemViewErrorState extends AddItemViewStates {
  final Failure error;

  AddItemViewErrorState(this.error);
}
