import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MP Lab 14',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OverflowDemoScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // ---- FIXED CRASH DEMO FUNCTION (Task 5) ----
  void _crashDemo() {
    String? name; // still null
    final safeName = name ?? 'Guest'; // FIX: default value
    print(safeName.toUpperCase()); // no crash now
  }
  // ------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            onPressed: _crashDemo,
            tooltip: 'Crash Demo',
            child: const Icon(Icons.warning),
          ),
        ],
      ),
    );
  }
}
class OverflowDemoScreen extends StatelessWidget {
  const OverflowDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Overflow Demo")),
      body: Center(
        child: Row(
          children: const [
            Icon(Icons.image, size: 80),
            SizedBox(width: 10),

            Expanded(
              child: Text(
                "This text is intentionally extremely long to cause a RenderFlex overflow in a Row.",
                style: TextStyle(fontSize: 22),
                softWrap: true,
              ),
            ),
          ],
        ),

      ),
      ),
    );
  }
}



