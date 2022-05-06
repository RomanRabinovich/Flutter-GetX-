import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetXApp());
}

class GetXApp extends StatelessWidget {
  final Favorites favorites = Get.put(Favorites());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text('My favorite fruit is ${favorites.fruit.value.name}.')),
        ),
        body: Center(
          child: Column(
            children: [
              FruitButton('Apples'),
              FruitButton('Oranges'),
              FruitButton('Bananas'),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitButton extends StatelessWidget {
  final String fruit;

  FruitButton(this.fruit);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(fruit),
        onPressed: () {
          Get.find<Favorites>().changeFruit(fruit);
        });
  }
}

class Favorites extends GetxController {
  final fruit = Fruit().obs;

  void changeFruit(String newFruit) {
    fruit.update((thisFruit) {
      thisFruit!.name = newFruit;
    });
    
  }
}

class Fruit {
  String name;

  Fruit({this.name = 'unknown'});
}
