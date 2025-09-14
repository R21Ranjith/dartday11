// Interface
abstract class Vehicle {
  void start();
  void stop();
}

// Car implementing Vehicle
class Car implements Vehicle {
  String brand;

  Car(this.brand);

  @override
  void start() {
    print("$brand car started.");
  }

  @override
  void stop() {
    print("$brand car stopped.");
  }
}

// Bike implementing Vehicle
class Bike implements Vehicle {
  String brand;

  Bike(this.brand);

  @override
  void start() {
    print("$brand bike started.");
  }

  @override
  void stop() {
    print("$brand bike stopped.");
  }
}

void main() {
  Vehicle car = Car("Toyota");
  Vehicle bike = Bike("Yamaha");

  car.start();
  car.stop();

  bike.start();
  bike.stop();
}
