import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.initial()) {
    on<ColorChangeEvent>((event, Emitter<ColorState> emit) {
      if (state.backGndColor == const Color.fromARGB(255, 240, 72, 60)) {
        emit(state.copyWith(color: const Color.fromARGB(255, 207, 165, 38)));
      } else if (state.backGndColor ==
          const Color.fromARGB(255, 207, 165, 38)) {
        emit(state.copyWith(color: const Color.fromARGB(255, 35, 217, 41)));
      } else if (state.backGndColor == const Color.fromARGB(255, 35, 217, 41)) {
        emit(state.copyWith(color: const Color.fromARGB(255, 144, 36, 163)));
      } else if (state.backGndColor ==
          const Color.fromARGB(255, 144, 36, 163)) {
        emit(state.copyWith(color: const Color.fromARGB(255, 240, 72, 60)));
      }
    });
  }
}
