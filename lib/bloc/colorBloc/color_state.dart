part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color backGndColor;
  const ColorState({required this.backGndColor});

  @override
  List<Object> get props => [backGndColor];

  factory ColorState.initial() {
    return const ColorState(backGndColor: Color.fromARGB(255, 240, 72, 60));
  }

  ColorState copyWith({Color? color}) {
    return ColorState(backGndColor: color ?? backGndColor);
  }
}
