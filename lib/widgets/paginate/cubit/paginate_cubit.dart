import 'package:bloc/bloc.dart';
import 'package:e_commerce/widgets/paginate/paginate.dart';
import 'package:equatable/equatable.dart';

part 'paginate_state.dart';

abstract class PaginateCubit<T extends PaginateState> extends Cubit<T> {
  PaginateCubit(super.initialState);

  Future<void> fetchFirstData();

  Future<void> fetchNextData();
}
