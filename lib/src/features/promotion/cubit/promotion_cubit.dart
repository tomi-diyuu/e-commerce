import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/network/model/promotion/promotion.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'promotion_state.dart';

class PromotionCubit extends Cubit<PromotionState> {
  PromotionCubit() : super(PromotionState()) {
    fetchPromotions();
  }

  final _domain = DomainManager();

  void fetchPromotions() async {
    emit(state.copyWith(status: MStatus.loading));

    final result = await _domain.promotion.getPromotions();

    if (result.isSuccess) {
      emit(state.copyWith(status: MStatus.success, promotions: result.data!));
    } else {
      emit(state.copyWith(status: MStatus.failure));
    }
  }

  void changedPromotion(MPromotion promotion) {
    emit(state.copyWith(selectedPromotion: promotion, code: promotion.code));
    GetIt.I<CartCubit>().applyPromotion(promotion);
  }

  void clearedPromotion() {
    emit(state.copyWith(
        code: "",
        selectedPromotion:
            MPromotion(id: '', code: '', description: '', minOrderValue: 0)));
    GetIt.I<CartCubit>().applyPromotion(null);
  }

  void changedCode(String code) {
    emit(state.copyWith(code: code));
  }
}
