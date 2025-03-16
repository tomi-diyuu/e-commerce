part of 'promotion_cubit.dart';

final class PromotionState extends Equatable {
  const PromotionState(
      {this.status = MStatus.initial,
      this.promotions = const [],
      this.code = "",
      this.selectedPromotion = const MPromotion(
          id: '', code: '', description: "", minOrderValue: 0)});

  final MStatus status;
  final List<MPromotion> promotions;
  final MPromotion selectedPromotion;
  final String code;

  @override
  List<Object> get props => [status, promotions, code, selectedPromotion];

  PromotionState copyWith(
      {MStatus? status,
      List<MPromotion>? promotions,
      MPromotion? selectedPromotion,
      String? code}) {
    return PromotionState(
        status: status ?? this.status,
        promotions: promotions ?? this.promotions,
        code: code ?? this.code,
        selectedPromotion: selectedPromotion ?? this.selectedPromotion);
  }
}
