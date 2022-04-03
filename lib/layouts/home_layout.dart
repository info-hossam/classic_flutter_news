import 'package:classic_flutter_news/shared/components/shared_components.dart';
import 'package:classic_flutter_news/shared/cubit/main_cubit.dart';
import 'package:classic_flutter_news/shared/cubit/main_states.dart';
import 'package:classic_flutter_news/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final _cubit = MainCubit.get(context);
        final _currentIndex = _cubit.currentIndex;

        return Scaffold(
          appBar: defaultAppBar(
            title: _cubit.appBarTitles[_currentIndex],
          ),
          body: _cubit.screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (newIndex) =>
                _cubit.changeBottomNavigationBarCurrentIndex(newIndex),
            elevation: 6.5,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kLightBlue,
            items: _cubit.itemsList,
          ),
        );
      },
    );
  }
}
