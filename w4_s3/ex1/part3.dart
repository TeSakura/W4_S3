import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Selectable Button')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableButton(), // First button
              SizedBox(height: 20), // Space between buttons
              SelectableButton(), // Second button
              SizedBox(height: 20), // Space between buttons
              SelectableButton(), // Third button
              SizedBox(height: 20), // Space between buttons
              SelectableButton(), // Fourth button
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  // Getters for button text, text color, and background color based on selection state
  String get buttonText => isSelected ? 'Selected' : 'Not Selected';
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected; // Toggle selection state on click
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
