/*
 Enums allow you to define a type with a fixed set of 
 constant values, making your code more readable and 
 less prone to errors.
*/
enum AnimalType { land, air }

class Animal {
  final String imageUrl;
  final AnimalType type;

  Animal({
    required this.imageUrl,
    required this.type,
  });
}

final allAnimals = [
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/animal1.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird1.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird2.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/animal2.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird3.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/animal3.png',
  ),
];
