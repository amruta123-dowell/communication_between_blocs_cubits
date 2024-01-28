import 'package:communication_between_blocs_cubits/bloc/colorBloc/color_bloc.dart'
    as colorBloc;
import 'package:communication_between_blocs_cubits/bloc/counterBloc/counter_bloc.dart';
import 'package:communication_between_blocs_cubits/blocScreen/bloc_color_change_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),

          ///Using StreamSubscription
          // create: (context) =>
          //     CounterCubit(colorCubit: context.read<ColorCubit>())
        ),
        BlocProvider<colorBloc.ColorBloc>(
            create: (context) => colorBloc.ColorBloc()),
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()

            //This is used StreamBuilder is used
            // CounterBloc(context.read<colorBloc.ColorBloc>())
            )
      ],
      child: const MaterialApp(
          home:
              //USING BLOC
              BlocListenerColorChangeBlocScreen()
          //using streamSubscription
          // BlocColorChangeScreen()

          //USING CUBIT
          // ChangeColorScreenBlocListener()

          //using StreamSubscription
          // ChangeColorScreen(),
          ),
    );
  }
}

// class ChangeColorScreen extends StatelessWidget {
//   const ChangeColorScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.watch<ColorCubit>().state.color,
//       appBar: AppBar(
//         title: const Text("Change color screen"),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 context.read<ColorCubit>().changeColor();
//               },
//               child: const Text("Change background")),
//           const SizedBox(
//             height: 30,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 context.read<CounterCubit>().changeCounter();
//               },
//               child: const Text("Change count button")),
//           const SizedBox(
//             height: 30,
//           ),
//           Text(
//             "${context.watch<CounterCubit>().state.incrementCount}",
//             style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
//                 color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
//           ),
//         ],
//       )),
//     );
//   }
// }

///Using BlocListener
class ChangeColorScreenBlocListener extends StatefulWidget {
  const ChangeColorScreenBlocListener({super.key});

  @override
  State<ChangeColorScreenBlocListener> createState() =>
      _ChangeColorScreenBlocListenerState();
}

class _ChangeColorScreenBlocListenerState
    extends State<ChangeColorScreenBlocListener> {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == const Color.fromARGB(255, 240, 72, 60)) {
          incrementSize = 1;
        } else if (state.color == const Color.fromARGB(255, 207, 165, 38)) {
          incrementSize = 10;
        } else if (state.color == const Color.fromARGB(255, 35, 217, 41)) {
          incrementSize = 100;
        } else if (state.color == const Color.fromARGB(255, 144, 36, 163)) {
          context.read<CounterCubit>().changeCounter(-100);
          incrementSize = -100;
        }
      },
      child: Scaffold(
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
                  context.read<CounterCubit>().changeCounter(incrementSize);
                },
                child: const Text("Change count button")),
            const SizedBox(
              height: 30,
            ),
            Text(
              "${context.watch<CounterCubit>().state.incrementCount}",
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
