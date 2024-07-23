import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/controllers/news_state.dart';
import 'package:news/services/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> general = [];
  void getGeneral() {
    emit(NewsGetGeneralLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'apiKey': '3c23c102cdce43f3bd8cbf5f73577def',
      },
    ).then((value) {
      general = value.data['articles']
          .where((article) => article['urlToImage'] != null && article['status'] != 'removed'
          ).toList();
      emit(NewsGetGeneralSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsGetGeneralErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '3c23c102cdce43f3bd8cbf5f73577def',
      },
    ).then((value) {
      sports = value.data['articles']
          .where((article) => article['urlToImage'] != null && article['status'] != 'removed')
          .toList();
      emit(NewsSportsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsSportsErrorState(error.toString()));
    });

  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '3c23c102cdce43f3bd8cbf5f73577def',
      },
    ).then((value) {
      business = value.data['articles']
          .where((article) => article['urlToImage'] != null && article['status'] != 'removed')
          .toList();
      emit(NewsBusinessSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> technology = [];
  void getTechnology() {
    emit(NewsTechnologyLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'technology',
        'apiKey': '3c23c102cdce43f3bd8cbf5f73577def',
      },
    ).then((value) {
      technology = value.data['articles']
          .where((article) => article['urlToImage'] != null && article['status'] != 'removed')
          .toList();
      emit(NewsTechnologySuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsTechnologyErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '3c23c102cdce43f3bd8cbf5f73577def',
      },
    ).then((value) {
      science = value.data['articles']
          .where((article) => article['urlToImage'] != null && article['status'] != 'removed')
          .toList();
      emit(NewsScienceSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsScienceErrorState(error.toString()));
    });
  }

  List<String> imgList = [];
  void fetchImages() async {
    try {
      final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=3c23c102cdce43f3bd8cbf5f73577def'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> articles = data['articles'];
        imgList = articles
            .map((item) => item['urlToImage'] as String?)
            .where((url) => url != null)
            .cast<String>()
            .toList();
      } else {
        print('Failed to load images');
      }
    } catch (error) {
      print(error);
    }
  }

}