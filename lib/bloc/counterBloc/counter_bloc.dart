import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:communication_between_blocs_cubits/cubits/cubit/color_cubit.dart';
import 'package:equatable/equatable.dart';

import '../colorBloc/color_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   int incrementNumber = 1;
//   late final StreamSubscription colorSubscription;
//   CounterBloc(ColorBloc colorBloc) : super(CounterState.initial()) {
//     colorSubscription = colorBloc.stream.listen((colorState) {
//       if (colorState.backGndColor == const Color.fromARGB(255, 240, 72, 60)) {
//         incrementNumber = 1;
//       } else if (colorState.backGndColor ==
//           const Color.fromARGB(255, 207, 165, 38)) {
//         incrementNumber = 10;
//       } else if (colorState.backGndColor ==
//           const Color.fromARGB(255, 35, 217, 41)) {
//         incrementNumber = 100;
//       } else if (colorState.backGndColor ==
//           const Color.fromARGB(255, 144, 36, 163)) {
//         state.copyWith(count: incrementNumber + state.incrementCount);
//         // add(CounterChangeEvent());
//         incrementNumber = -100;
//       }
//     });
//     on<CounterChangeEvent>((event, emit) {
//       emit(state.copyWith(count: incrementNumber + state.incrementCount));
//     });
//   }

//   @override
//   Future<void> close() {
//     colorSubscription.cancel();
//     return super.close();
//   }
// }

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterChangeEventWithArg>(changeCounterValue);
  }

  FutureOr<void> changeCounterValue(
    CounterChangeEventWithArg event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(count: event.count + state.incrementCount));
  }
}
