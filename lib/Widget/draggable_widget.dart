import 'package:draggable/Data/data.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final Animal animal;
  const DraggableWidget({super.key, required this.animal});

  static double size = 150;

  @override
  Widget build(BuildContext context) {
    return Draggable<Animal>(
      data: animal,
      feedback: buildImage(),
      childWhenDragging: Container(height: size),
      child: buildImage(),
    );
  }

  Widget buildImage() {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Image.asset(animal.imageUrl),
    );
  }
}
