import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_project/layout/news_app/cubit/states.dart';
import 'package:flutter_first_project/modules/business/business_screen.dart';
import 'package:flutter_first_project/modules/science/science_screen.dart';
import 'package:flutter_first_project/modules/setting/setting_screen.dart';
import 'package:flutter_first_project/modules/sports/sports_screen.dart';
import 'package:flutter_first_project/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screen = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_handball_sharp,
      ),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    // if (index == 1) getSport();
    // if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apikey': 'c1c48d3767d149ecbe614ef09a7eab4b',
        },
      ).then((value) {
        business = value.data['articles'];

        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());

        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sport = [];

  void getSport() {
    emit(NewsGetSportLoadingState());

    if (sport.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sport',
          'apikey': 'c1c48d3767d149ecbe614ef09a7eab4b',
        },
      ).then((value) {
        sport = value.data['articles'];

        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());

        emit(NewsGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apikey': 'c1c48d3767d149ecbe614ef09a7eab4b',
        },
      ).then((value) {
        science = value.data['articles'];

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());

        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }


  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apikey': 'c1c48d3767d149ecbe614ef09a7eab4b',
      },
    ).then((value) {
      search = value.data['articles'];

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
