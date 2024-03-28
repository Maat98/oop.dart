import 'dart:io';

abstract class Vehicle {
  void start();
}

class Car implements Vehicle {
  String brand;
  int year;

  Car(this.brand, this.year);

  @override
  void start() {
    print('$brand $year car is starting.');
  }
}

void main() {
  var car = readCarFromFile('car_data.txt');

  car.start();

  for (var i = 0; i < 5; i++) {
    print('Loop iteration $i');
  }
}

Car readCarFromFile(String filename) {
  var file = File(filename);
  var lines = file.readAsLinesSync();
  var data = lines[0].split(',');

  var brand = data[0];
  var year = int.parse(data[1]);

  return Car(brand, year);
}
