import 'package:communication_between_blocs_cubits/bloc/colorBloc/color_bloc.dart';
import 'package:communication_between_blocs_cubits/bloc/counterBloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocColorChangeScreen extends StatelessWidget {
  const BlocColorChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorBloc>().state.backGndColor,
      appBar: AppBar(
        title: const Text("BLOC CHANGE COLOR SCREEN"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<ColorBloc>().add(ColorChangeEvent());
              },
              child: const Text("Change background")),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterChangeEvent());
              },
              child: const Text("Change count button")),
          const SizedBox(
            height: 30,
          ),
          Text(
            "${context.watch<CounterBloc>().state.incrementCount}",
            style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}

class BlocListenerColorChangeBlocScreen extends StatefulWidget {
  const BlocListenerColorChangeBlocScreen({super.key});

  @override
  State<BlocListenerColorChangeBlocScreen> createState() =>
      _BlocListenerColorChangeBlocScreenState();
}

class _BlocListenerColorChangeBlocScreenState
    extends State<BlocListenerColorChangeBlocScreen> {
  int incrementNumber = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, state) {
        if (state.backGndColor == const Color.fromARGB(255, 240, 72, 60)) {
          incrementNumber = 1;
        } else if (state.backGndColor ==
            const Color.fromARGB(255, 207, 165, 38)) {
          incrementNumber = 10;
        } else if (state.backGndColor ==
            const Color.fromARGB(255, 35, 217, 41)) {
          incrementNumber = 100;
        } else if (state.backGndColor ==
            const Color.fromARGB(255, 144, 36, 163)) {
          incrementNumber = -100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.backGndColor,
        appBar: AppBar(
          title: const Text("BLOC BACKGROUND COLOR CHANGE SCREEN"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<ColorBloc>().add(ColorChangeEvent());
                },
                child: const Text("Change background")),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(CounterChangeEventWithArg(count: incrementNumber));
                },
                child: const Text("Change count button")),
            const SizedBox(
              height: 30,
            ),
            Text(
              "${context.watch<CounterBloc>().state.incrementCount}",
              style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}
