import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/health.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sport.dart';
import 'package:news_app/shared/dio.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  String selectedValue = 'eg';
  void onDropDownChange(value) {
    selectedValue = value;
    emit(DropMenuButtonValue());
  }

  List<Widget> widgetList = [Health(), Sport(), Science()];
  int currentIndex = 0;
  void changeBottomNav(index) {
    currentIndex = index;
    emit(BottomNavBarChange());
  }

  List<dynamic> health = [];
  void getHealth() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': selectedValue,
      'category': 'health',
      'apiKey': '43cb2cb4aee045da8aeade4c9bfd8cc2'
    }).then((value) {
      health = value.data['articles'];
      print(health);
      emit(HealthSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HealthErrorState());
    });
  }

  List<dynamic> science = [];
  void getScience() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': selectedValue,
      'category': 'science',
      'apiKey': '43cb2cb4aee045da8aeade4c9bfd8cc2'
    }).then((value) {
      science = value.data['articles'];
      print(science.toString());
      emit(ScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ScienceErrorState());
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': selectedValue,
      'category': 'sports',
      'apiKey': '43cb2cb4aee045da8aeade4c9bfd8cc2'
    }).then((value) {
      sports = value.data['articles'];
      emit(SportsSuccessState());
      print(sports.toString());
    }).catchError((error) {
      emit(SportsErrorState());
      print(error.toString());
    });
  }
}
