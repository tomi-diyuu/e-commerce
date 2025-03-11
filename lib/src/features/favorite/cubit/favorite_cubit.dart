import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/widgets/paginate/cubit/paginate_cubit.dart';
import 'package:e_commerce/widgets/paginate/paginate.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit
    extends PaginateCubit<FavoriteState<DocumentSnapshot<MProduct>>> {
  FavoriteCubit() : super(FavoriteState(XPaginate.initial()));
  
  @override
  Future<void> fetchFirstData() {
    // TODO: implement fetchFirstData
    throw UnimplementedError();
  }
  
  @override
  Future<void> fetchNextData() {
    // TODO: implement fetchNextData
    throw UnimplementedError();
  }

  
}
