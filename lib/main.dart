import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semar/features/categories/cubit.dart';
import 'package:semar/features/slider/cubit.dart';
import 'package:semar/views/home_nav/pages/home.dart';
import 'package:semar/views/home_nav/pages/my_account.dart';
import 'package:semar/views/home_nav/view.dart';
import 'package:semar/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider (
          create: (BuildContext context) => SliderCubit()..getData(),
        ),
        BlocProvider (
          create: (BuildContext context) => CategoriesCubit()..getData(),
        ),
      ],
      child: MaterialApp(
        title: 'Semar App',
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        ),
        theme: ThemeData(
          fontFamily: "Tajawal",
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xf4C8613)),
          useMaterial3: true,
        ),
        home: HomeNavView(),
      ),
    );
  }
}
