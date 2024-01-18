import 'package:insights_news_1_11/core/news_model/news_model.dart';

class NewsState {}

class NewsInit extends NewsState {}

class NewsByCategoryLoadingState extends NewsState {}

class NewsByCategorySuccessState extends NewsState {
  final NewsModel model;

  NewsByCategorySuccessState({required this.model});
}

class NewsByCategoryErrorState extends NewsState {
  final String error;

  NewsByCategoryErrorState({required this.error});
}

// header slider
class NewsSliderLoadingState extends NewsState {}

class NewsSliderSuccessState extends NewsState {
  final NewsModel model;

  NewsSliderSuccessState({required this.model});
}

class NewsSliderErrorState extends NewsState {
  final String error;

  NewsSliderErrorState({required this.error});
}

// -----search

class NewsBySearchLoadingState extends NewsState {}

class NewsBySearchSuccessState extends NewsState {
  final NewsModel model;

  NewsBySearchSuccessState({required this.model});
}

class NewsBySearchErrorState extends NewsState {
  final String error;

  NewsBySearchErrorState({required this.error});
}

// source

class NewsBySourceLoadingState extends NewsState {}

class NewsBySourceSuccessState extends NewsState {
  final NewsModel model;

  NewsBySourceSuccessState({required this.model});
}

class NewsBySourceErrorState extends NewsState {
  final String error;

  NewsBySourceErrorState({required this.error});
}
