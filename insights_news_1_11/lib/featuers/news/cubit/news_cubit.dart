import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news_1_11/core/services/api_services.dart';
import 'package:insights_news_1_11/featuers/news/cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInit());

  getNewsByCategory(category) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices().getNewsByCategory(category).then((value) {
        emit(NewsByCategorySuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState(error: e.toString()));
    }
  }

  getNewsSlider() {
    emit(NewsSliderLoadingState());
    try {
      ApiServices().getNewsByCategory('sports').then((value) {
        emit(NewsSliderSuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsSliderErrorState(error: e.toString()));
    }
  }

  getNewsBySearch(searchText) {
    emit(NewsBySearchLoadingState());
    try {
      ApiServices().getNewsBySearch(searchText).then((value) {
        emit(NewsBySearchSuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsBySearchErrorState(error: e.toString()));
    }
  }

  getNewsBySource(source) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices().getNewsBySource(source).then((value) {
        emit(NewsByCategorySuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState(error: e.toString()));
    }
  }
}
