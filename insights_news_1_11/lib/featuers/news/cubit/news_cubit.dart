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
