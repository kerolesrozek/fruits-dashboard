import 'package:bloc/bloc.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruits_dashboard/features/add_product/domain/usecases/add_product_usecase.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.addProductUsecase) : super(AddProductInitial());
  final AddProductUsecase addProductUsecase;

  Future<void> addProduct({required AddProductEntity addProductEntity}) async {
    emit(AddProductLoading());
    var result = await addProductUsecase.call(
      addProductEntity: addProductEntity,
    );
    result.fold(
      (fail) {
        emit(AddProductFailure(errorMessage: fail.errorMessage));
      },
      (ifRight) {
        emit(AddProductSuccess());
      },
    );
  }
}
