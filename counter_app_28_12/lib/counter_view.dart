import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.toString(), style: const TextStyle(fontSize: 30)),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    style: IconButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      setState(() {
                        counter--;
                      });
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                    style: IconButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
