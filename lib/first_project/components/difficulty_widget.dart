import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({
    super.key,
    required this.difficulty,
  });

  final int difficulty;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: difficulty >= 1 ? Colors.deepPurple : Colors.deepPurple[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficulty >= 2 ? Colors.deepPurple : Colors.deepPurple[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficulty >= 3 ? Colors.deepPurple : Colors.deepPurple[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficulty >= 4 ? Colors.deepPurple : Colors.deepPurple[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficulty >= 5 ? Colors.deepPurple : Colors.deepPurple[100],
          size: 15,
        ),
      ],
    );
  }
}
