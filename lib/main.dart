import 'package:communication_between_blocs_cubits/cubits/cubit/color_cubit.dart';
import 'package:communication_between_blocs_cubits/cubits/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorCubit(),
      child: BlocProvider(
        create: (context) =>
            CounterCubit(colorCubit: context.read<ColorCubit>()),
        child: MaterialApp(
          home: ChangeColorSCreen(),
        ),
      ),
    );
  }
}

class ChangeColorSCreen extends StatelessWidget {
  const ChangeColorSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      appBar: AppBar(
        title: const Text("Change color screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<ColorCubit>().changeColor();
              },
              child: const Text("Change background")),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().changeCounter();
              },
              child: const Text("Change count button")),
          const SizedBox(
            height: 30,
          ),
          Text("${context.watch<CounterCubit>().state.incrementCount}"),
        ],
      )),
    );
  }
}
