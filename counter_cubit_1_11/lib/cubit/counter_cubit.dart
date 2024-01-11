import 'package:counter_cubit_1_11/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInit());

  int counter = 0;

  void add() {
    counter++;
    emit(CounterUpdatedState());
  }

  void remove() {
    counter--;
    emit(CounterUpdatedState());
  }
}
