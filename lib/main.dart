import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lgatcha/app_bloc_observer.dart';
import 'package:lgatcha/cubit/tempatmakan_cubit.dart';
import 'package:lgatcha/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TempatmakanCubit()..getDataTempatMakan(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LGatcha Food',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserHomePage(),
      ),
    );
  }
}
