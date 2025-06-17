import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _setCounter(int number) => setState(() {
    _counter = number;
  });

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(backgroundColor: Colors.green, title: Text("Flutter App")),

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 16),

          Text(
            "Enter value to increment counter",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
          ),

          const SizedBox(height: 8),

          Text(
            "$_counter",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Enter number",
                label: const Text("Enter number"),
                suffixIcon: IconButton(
                  onPressed: () {
                    _setCounter(_counter += 1);
                    final text = "$_counter";
                    _controller.value = _controller.value.copyWith(
                      text: text,
                      selection: TextSelection.collapsed(offset: text.length),
                    );
                  },
                  icon: Icon(Icons.keyboard_arrow_up),
                ),
              ),
              onChanged: (value) {
                _setCounter(int.parse(value));
              },
            ),
          ),
        ],

      ),
    ),

    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        _setCounter(_counter += 1);
        final text = "$_counter";
        _controller.value = _controller.value.copyWith(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
      },
      child: Icon(Icons.add, color: Colors.white),
    ),
  );
}