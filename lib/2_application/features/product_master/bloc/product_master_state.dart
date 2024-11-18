part of 'product_master_bloc.dart';

@immutable
sealed class StateProductMaster {}

final class StateInitialProductMaster extends StateProductMaster {}

final class StateLoadingProductMaster extends StateProductMaster {}

final class StateLoadedProductMaster extends StateProductMaster {}

final class StateErrorProductMaster extends StateProductMaster {
  final String paraErrorMessage;
  StateErrorProductMaster({required this.paraErrorMessage});
}
