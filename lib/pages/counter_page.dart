import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Text(
          "${counter.counter}",
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counter.decrement,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: counter.increment,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
