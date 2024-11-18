import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_master_event.dart';
part 'product_master_state.dart';

class ProductMasterBloc extends Bloc<EventProductMaster, StateProductMaster> {
  ProductMasterBloc() : super(StateInitialProductMaster()) {
    // on<ProductMasterEvent>((event, emit) {

    // });
    on<EventRequestProductMaster>((event, emit) async {
      emit(StateLoadingProductMaster());
      //Here we can execute our business logic
      //for example get advice
      debugPrint('Fake get advice');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advice');
      emit(StateLoadedProductMaster());
    });
  }
}
