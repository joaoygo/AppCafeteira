import 'package:cafeteira/repositories/coffee_repository.dart';
import 'package:cafeteira/viewModel/coffee_view_model.dart';
import 'package:get/get.dart';

class DetailsCoffeeController extends GetxController {
  final CoffeeRepository _coffeeRepository = CoffeeRepository();
  RxDouble coffeeValue = 0.0.obs;
  RxInt coffeeQuantity = 1.obs;
  RxDouble valueQuantitySugar = 0.0.obs;
  RxDouble valueSizeCoffee = 0.0.obs;
  RxDouble valueBaseCoffee = 0.0.obs;
  RxString sizeCoffee = ''.obs;
  RxString quantitySugar = ''.obs;

  void setQuantitySugar(int valueSugar) {
    quantitySugar.value = valueSugar.toString();
    double unitSugar = 0.23;
    valueQuantitySugar.value = unitSugar * valueSugar;
    setValueTotal();
  }

  void setSizeCoffee(String size) {
    sizeCoffee.value = size;
    if (size == 'P') {
      valueSizeCoffee.value = valueBaseCoffee.value;
      setValueTotal();
    } else if (size == 'M') {
      valueSizeCoffee.value = valueBaseCoffee.value + 1.5;
      setValueTotal();
    } else if (size == 'G') {
      valueSizeCoffee.value = valueBaseCoffee.value + 3.0;
      setValueTotal();
    }
    setValueTotal();
  }

  void setValueBaseCoffee(double valueBase) {
    valueBaseCoffee.value = valueBase;
  }

  void incrementCoffeeQuantity() {
    coffeeQuantity.value += 1;
    setValueTotal();
  }

  void decrementCoffeeQuantity() {
    coffeeQuantity.value == 1
        ? coffeeQuantity.value = 1
        : coffeeQuantity.value -= 1;
    setValueTotal();
  }

  void setValueTotal() {
    coffeeValue.value = ((valueQuantitySugar.value + valueSizeCoffee.value) *
        coffeeQuantity.value);
  }

  Future<void> addToCart(String name) async {
    await _coffeeRepository.addCoffee(CoffeeViewModel(
        name: name,
        amount: coffeeQuantity.value,
        size: sizeCoffee.value,
        price: coffeeValue.value,
        sugar: quantitySugar.value));
    coffeeQuantity.value = 1;
    sizeCoffee.value = '';
    coffeeValue.value = 0;
    quantitySugar.value = '';
  }
}
