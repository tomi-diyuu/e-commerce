import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/router/router.dart';
import 'package:e_commerce/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = GetIt.I<AppRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                GetIt.I<AccountBloc>()..add(AccountSubcriptionRequested())),
        BlocProvider(
            create: (_) =>
                GetIt.I<CartCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: AppTheme.light(),
        routerConfig: _appRouter.router,
      ),
    );
  }
}
