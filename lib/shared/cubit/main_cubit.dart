import 'package:classic_flutter_news/modules/categories/categories_screen.dart';
import 'package:classic_flutter_news/modules/favorites/favorites_screen.dart';
import 'package:classic_flutter_news/modules/home/home_screen.dart';
import 'package:classic_flutter_news/modules/settings/settings_screen.dart';
import 'package:classic_flutter_news/shared/components/constants.dart';
import 'package:classic_flutter_news/shared/cubit/main_states.dart';
import 'package:classic_flutter_news/shared/network/remote/dio_helper.dart';
import 'package:classic_flutter_news/shared/network/remote/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainAppInitState());

  ///singleton object -> to avoid creating more than one object from this class
  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  ///cubit properties

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<String> _appBarTitles = [
    'Classic Flutter News',
    'Explore',
    'Favorites',
    'Settings',
  ];
  List<String> get appBarTitles => _appBarTitles;

  List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  List<Widget> get screens => _screens;

  List<BottomNavigationBarItem> _itemsList = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
  ];
  List<BottomNavigationBarItem> get itemsList => _itemsList;

  ///cubit functions

  ///Change bottom navigation bar index using the [currentIndex] property
  ///If [currentIndex = 0] this means it will start from the first item in the list
  ///It will take a [newIndex] parameter, that we will need to change the [currentIndex] to it.
  ///Method will be [void] as it will return nothing...
  void changeBottomNavigationBarCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    emit(MainAppChangeBottomNavigationBarCurrentIndexState());
  }

  List<dynamic> _allNews = [];

  List<dynamic> get allNews => _allNews;

  List<dynamic> _topHeadlines = [];

  List<dynamic> get topHeadlines => _topHeadlines;

  void getAllNews() {
    emit(MainAppGetWholeDataLoadingState());
    DioHelper.getData(
      url: kAllNewsPoint,
      query: {
        'apiKey': kNewsApiKey,
        'q': 'Covid-19',
      },
    ).then(
      (newsData) {
        //articles[0].title
        print('all-news => ${newsData.data['articles'][0]}');
        _allNews = newsData.data['articles'];
        emit(MainAppGetWholeDataSuccessState());
      },
    ).catchError(
      (error) {
        print('1 => ${error.toString()}');
        emit(MainAppGetWholeDataErrorState());
      },
    );
  }

  void getTopHeadlines() {
    emit(MainAppGetTopHeadlinesLoadingState());
    DioHelper.getData(
      url: kTopHeadlinesPoint,
      query: {
        'apiKey': kNewsApiKey,
        'country': 'eg',
      },
    ).then(
      (newsData) {
        print('top-headlines => ${newsData.data['articles'][0]}');
        _topHeadlines = newsData.data['articles'];
        emit(MainAppGetTopHeadlinesSuccessState());
      },
    ).catchError(
      (error) {
        print('11 => ${error.toString()}');
        emit(MainAppGetTopHeadlinesErrorState());
      },
    );
  }
}
