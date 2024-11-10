import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScoreCard(title: 'My score in Flutter'),
              SizedBox(height: 20),
              ScoreCard(title: 'My score in Dart'),
              SizedBox(height: 20),
              ScoreCard(title: 'My score in React'),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;

  const ScoreCard({super.key, required this.title});

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int _score = 0;

  void _incrementScore() {
    if (_score < 10) {
      setState(() {
        _score++;
      });
    }
  }

  void _decrementScore() {
    if (_score > 0) {
      setState(() {
        _score--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      width: 300,
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _decrementScore,
              ),
              Text(
                '$_score',
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _incrementScore,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              // Background bar
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Progress bar
              Container(
                height: 20,
                width: (300 * (_score / 10)).clamp(0.0, 300.0), // Width based on score
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
