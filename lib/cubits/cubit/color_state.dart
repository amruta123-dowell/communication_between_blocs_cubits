part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;
  const ColorState({required this.color});

  @override
  List<Object> get props => [color];

  factory ColorState.initial() {
    return const ColorState(color: Color.fromARGB(255, 240, 72, 60));
  }

  ColorState copyWith({Color? color}) {
    return ColorState(color: color ?? this.color);
  }
}
