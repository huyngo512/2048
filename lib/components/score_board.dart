import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../const/colors.dart';
import '../managers/board.dart';
import '../models/board.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardCubit, Board>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Score(label: 'Score', score: '${state.score}'),
            const SizedBox(
              width: 8.0,
            ),
            Score(
                label: 'Best',
                score: '${state.best}',
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0)),
          ],
        );
      },
    );
  }
}

class Score extends StatelessWidget {
  const Score(
      {super.key, required this.label, required this.score, this.padding});

  final String label;
  final String score;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: scoreColor, borderRadius: BorderRadius.circular(8.0)),
      child: Column(children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 18.0, color: color2),
        ),
        Text(
          score,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
        )
      ]),
    );
  }
}
