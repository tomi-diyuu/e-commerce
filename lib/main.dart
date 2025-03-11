import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/src/_dev/fake_data.dart';
import 'package:e_commerce/src/app.dart';
import 'package:e_commerce/src/bloc_observer.dart';
import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/router/router.dart';
import 'package:e_commerce/src/services/user_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const XBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await UserPrefs.instance.initialize();
  await dotenv.load(fileName: '.env');
  _locator();
  // print("Upload starting..");
  // final upload = UpLoad();
  // await upload.uploadProducts();
  runApp(MyApp());
}

void _locator() {
  GetIt.I.registerLazySingleton(() => AppRouter());
  GetIt.I.registerLazySingleton(() => DomainManager());
  GetIt.I.registerLazySingleton(() => AccountBloc());
  GetIt.I.registerLazySingleton(() => CartCubit());
}
