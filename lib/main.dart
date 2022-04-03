// import 'package:bloc/bloc.dart';
import 'package:classic_flutter_news/layouts/home_layout.dart';
import 'package:classic_flutter_news/shared/cubit/main_cubit.dart';
import 'package:classic_flutter_news/shared/network/remote/dio_helper.dart';
import 'package:classic_flutter_news/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'shared/bloc_observer.dart';

void main() {
  // Bloc.observer = MyBlocObserver();
  DioHelper.initDio();
  runApp(ClassicFlutterNews());
}

class ClassicFlutterNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()
        ..getAllNews()
        ..getTopHeadlines(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        // theme: ThemeData.light().copyWith(
        //   scaffoldBackgroundColor: Color(0xFFFAFAFA),
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: kWhite,
        //   ),
        // ),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFAFAFA),
          appBarTheme: AppBarTheme(
            backgroundColor: kWhite,
          ),
          primarySwatch: Colors.lightGreen,
        ),
        home: HomeLayout(),
      ),
    );
  }
}
