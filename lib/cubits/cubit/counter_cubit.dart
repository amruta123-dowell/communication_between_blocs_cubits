import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'color_cubit.dart';

part 'counter_state.dart';

//Using StreamSubscription
// class CounterCubit extends Cubit<CounterState> {
//   int incrementSize = 1;

//   final ColorCubit colorCubit;
//   late final StreamSubscription colorSubscription;
//   CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
//     colorSubscription = colorCubit.stream.listen((ColorState colorState) {
//       if (colorState.color == const Color.fromARGB(255, 240, 72, 60)) {
//         incrementSize = 1;
//         print(incrementSize);
//       } else if (colorState.color == const Color.fromARGB(255, 207, 165, 38)) {
//         incrementSize = 10;
//       } else if (colorState.color == const Color.fromARGB(255, 35, 217, 41)) {
//         incrementSize = 100;
//       } else if (colorState.color == const Color.fromARGB(255, 144, 36, 163)) {
//         emit(state.copyWith(count: state.incrementCount - 100));
//         incrementSize = -100;
//       }
//       print("incrementSize is  $incrementSize");
//     });
//   }

//   void changeCounter() {
//     emit(state.copyWith(count: state.incrementCount + incrementSize));
//   }

//   @override
//   Future<void> close() {
//     colorSubscription.cancel();
//     return super.close();
//   }
// }

//Using BlocListener

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void changeCounter(int incrementSize) {
    emit(state.copyWith(count: state.incrementCount + incrementSize));
  }
}
