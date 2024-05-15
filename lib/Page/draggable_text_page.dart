import 'package:flutter/material.dart';

class DraggableTextPage extends StatelessWidget {
  const DraggableTextPage({super.key});

  Widget buildText(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      width: 160,
      height: 100,
      color: color,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 32),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DRAG & DRAGGABLE"),
        centerTitle: true,
      ),
      body: Center(
        child: Draggable(
          feedback: Material(child: buildText('Dragged', Colors.green)),
          childWhenDragging: buildText('Behind', Colors.red),
          child: buildText('Drag Me', Colors.purple),
        ),
      ),
    );
  }
}
