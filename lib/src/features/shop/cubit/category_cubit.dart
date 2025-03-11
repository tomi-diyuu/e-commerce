import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/category/category.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState()) {
    loadCategories();
  }

  final _domain = DomainManager();

  Future loadCategories() async {
    emit(state.copyWith(status: CategoryStatus.loading));
    final result = await _domain.catgory.getCategories();

    if (result.isSuccess) {
      emit(state.copyWith(
          categories: result.data, status: CategoryStatus.success));
    } else {
      emit(state.copyWith(status: CategoryStatus.failure));
    }
  }

  Future onSelectedCategoryChanged(MCategory category) async {
    emit(state.copyWith(selectedCategory: category));
  }
}
