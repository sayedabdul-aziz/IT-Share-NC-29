import 'package:counter_cubit_1_11/cubit/counter_cubit.dart';
import 'package:counter_cubit_1_11/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<CounterCubit>().counter.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().remove();
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 20),
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().add();
                        },
                        child: const Icon(Icons.add),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
