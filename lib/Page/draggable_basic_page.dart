import 'package:draggable/Data/data.dart';
import 'package:draggable/Widget/app_bar_widget.dart';
import 'package:draggable/Widget/draggable_widget.dart';
import 'package:draggable/Widget/utils.dart';
import 'package:flutter/material.dart';

class DraggableBasicPage extends StatefulWidget {
  const DraggableBasicPage({super.key});

  @override
  State<DraggableBasicPage> createState() => _DraggableBasicPageState();
}

class _DraggableBasicPageState extends State<DraggableBasicPage> {
  final List<Animal> all = allAnimals;
  int score = 0;

  Widget buildOrigin() {
    return Stack(
      alignment: Alignment.center,
      children: all
          .map(
            (animal) => DraggableWidget(animal: animal),
          )
          .toList(),
    );
  }

  Widget buildTargets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildSmallTarget(
          context,
          text: 'Animals',
          acceptType: AnimalType.land,
        ),
        buildSmallTarget(
          context,
          text: 'Birds',
          acceptType: AnimalType.air,
        ),
      ],
    );
  }

  Widget buildSmallTarget(
    BuildContext context, {
    required String text,
    required AnimalType acceptType,
  }) {
    return CircleAvatar(
      radius: 75,
      backgroundColor: Theme.of(context).primaryColor,
      child: DragTarget<Animal>(
        builder: (context, candidateData, rejectedData) {
          return Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          );
        },
        onWillAcceptWithDetails: (data) => true,
        onAcceptWithDetails: (data) {
          if (data.data.type == acceptType) {
            Utils.showSnackBar(
              context,
              text: 'This Is Correct 🥳',
              color: Colors.green,
            );

            setState(() {
              score += 50;
              all.removeWhere(
                (animal) => animal.imageUrl == data.data.imageUrl,
              );
            });
          } else {
            setState(() => score -= 20);

            Utils.showSnackBar(
              context,
              text: 'Try Again! 😥',
              color: Colors.red,
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(score: score),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildOrigin(),
            buildTargets(context),
          ],
        ),
      ),
    );
  }
}
