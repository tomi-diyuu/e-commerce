part of 'category_cubit.dart';

enum CategoryStatus { initial, loading, success, failure }

extension CategoryStatusX on CategoryStatus {
  bool get isLoading => this == CategoryStatus.loading;
  bool get isInitial => this == CategoryStatus.initial;
  bool get isSuccess => this == CategoryStatus.success;
  bool get isFailure => this == CategoryStatus.failure;
}

final class CategoryState extends Equatable {
  const CategoryState(
      {this.categories = const [],
      this.status = CategoryStatus.initial,
      this.selectedCategory = const MCategory(id: "")});

  final List<MCategory> categories;
  final CategoryStatus status;
  final MCategory selectedCategory;

  @override
  List<Object> get props => [categories, status, selectedCategory];

  CategoryState copyWith(
      {List<MCategory>? categories,
      bool? isLoading,
      CategoryStatus? status,
      MCategory? selectedCategory}) {
    return CategoryState(
        categories: categories ?? this.categories,
        status: status ?? this.status,
        selectedCategory: selectedCategory ?? this.selectedCategory);
  }
}
