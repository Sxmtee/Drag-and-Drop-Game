import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar({required int score}) {
  const double height = 52;

  return AppBar(
    title: const Text("DRAG & DRAGGABLE"),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(height),
      child: Container(
        color: Colors.black,
        alignment: Alignment.center,
        height: height,
        child: _buildScore(score),
      ),
    ),
  );
}

Widget _buildScore(int score) {
  const style = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Score ',
        style: style,
      ),
      SizedBox(
        width: 60,
        child: Text(
          '$score',
          style: style,
          textAlign: TextAlign.right,
        ),
      ),
    ],
  );
}
