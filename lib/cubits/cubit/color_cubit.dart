import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.initial());

  void changeColor() {
    if (state.color == const Color.fromARGB(255, 240, 72, 60)) {
      emit(state.copyWith(color: const Color.fromARGB(255, 207, 165, 38)));
    } else if (state.color == const Color.fromARGB(255, 207, 165, 38)) {
      emit(state.copyWith(color: const Color.fromARGB(255, 35, 217, 41)));
    } else if (state.color == const Color.fromARGB(255, 35, 217, 41)) {
      emit(state.copyWith(color: const Color.fromARGB(255, 144, 36, 163)));
    } else if (state.color == const Color.fromARGB(255, 144, 36, 163)) {
      emit(state.copyWith(color: const Color.fromARGB(255, 240, 72, 60)));
    }
  }
}
