import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/router/route_names.dart';

part 'navigation_bar_item.dart';

class DashboardCubit extends Cubit<XNavigationBarItems> {
  DashboardCubit(super.current);

  void onDestinationSelected(int index) {
    emit(XNavigationBarItems.values[index]);
    AppCoordinator.goNamed(state.route.name);
  }

  void goHome() {
    emit(XNavigationBarItems.home);
    AppCoordinator.goNamed(state.route.name);
  }
}
