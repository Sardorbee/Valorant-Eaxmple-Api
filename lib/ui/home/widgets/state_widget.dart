import 'package:flutter/material.dart';

class StateeWidget extends StatefulWidget {
  const StateeWidget({super.key});

  @override
  State<StateeWidget> createState() => _StateeWidgetState();
}

class _StateeWidgetState extends State<StateeWidget> {
  bool isPressed1 = false;
  bool isPressed0 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isPressed0 = !isPressed0;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    isPressed0 == true ? Colors.red : Colors.blue),
              ),
              child: const Text(
                "0",
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isPressed1 = !isPressed1;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    isPressed1 == true ? Colors.red : Colors.blue),
              ),
              child: const Text(
                "1",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
