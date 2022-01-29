import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'blocs/basket/basket_bloc.dart';
import 'blocs/bloc_observer.dart';
import 'dependencies/dependency_init.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = getIt<AppBlocObserver>();
  Bloc.transformer = sequential<dynamic>();

  runApp(
    AppRoot(
      cartBloc: getIt<BasketBloc>(),
    ),
  );
}
