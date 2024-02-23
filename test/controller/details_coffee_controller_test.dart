import 'package:cafeteira/controller/details_coffee_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailsCoffeeController', () {
    late DetailsCoffeeController controller;

    setUp(() {
      controller = DetailsCoffeeController();
    });

    test('setQuantitySugar() should update sugar values correctly', () {
      controller.setQuantitySugar(2);
      expect(controller.quantitySugar.value, '2');
      expect(controller.valueQuantitySugar.value, 0.46);
    });

    test('setSizeCoffee() should update coffee size values correctly', () {
      controller.setValueBaseCoffee(3.0);
      controller.setSizeCoffee('P');
      expect(controller.sizeCoffee.value, 'P');
      expect(controller.valueSizeCoffee.value, 3.0);

      controller.setSizeCoffee('M');
      expect(controller.sizeCoffee.value, 'M');
      expect(controller.valueSizeCoffee.value, 4.5);

      controller.setSizeCoffee('G');
      expect(controller.sizeCoffee.value, 'G');
      expect(controller.valueSizeCoffee.value, 6.0);
    });

    test('incrementCoffeeQuantity() should increment coffee quantity', () {
      controller.incrementCoffeeQuantity();
      expect(controller.coffeeQuantity.value, 2);
    });

    test('decrementCoffeeQuantity() should decrement coffee quantity', () {
      controller.decrementCoffeeQuantity();
      expect(controller.coffeeQuantity.value, 1);

      controller.decrementCoffeeQuantity();
      expect(controller.coffeeQuantity.value, 1);
    });

    test('setValueTotal() should update coffee value correctly', () {
      controller.setValueBaseCoffee(6.33);
      controller.setQuantitySugar(2);
      controller.setSizeCoffee('M');
      controller.incrementCoffeeQuantity();
      controller.setValueTotal();
      expect(controller.coffeeValue.value.toStringAsFixed(2),
          16.58.toStringAsFixed(2));
    });
  });
}
