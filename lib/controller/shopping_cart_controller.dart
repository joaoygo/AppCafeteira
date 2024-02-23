import 'package:cafeteira/repositories/coffee_repository.dart';
import 'package:cafeteira/viewModel/coffee_view_model.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  final CoffeeRepository _coffeeRepository = CoffeeRepository();
  RxList<CoffeeViewModel> listCoffee = <CoffeeViewModel>[].obs;
  RxDouble valueShoppingCart = 0.0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getListCoffeeCart();
  }

  Future<void> getListCoffeeCart() async {
    isLoading.value = true;
    listCoffee.value = await _coffeeRepository.getListCoffeeCart();
    valueCart();
    isLoading.value = false;
  }

  Future<void> removeCoffeeCart(CoffeeViewModel coffee) async {
    await _coffeeRepository.removeCoffeeCart(coffee);
    getListCoffeeCart();
    valueCart();
  }

  void valueCart() {
    double total = 0.0;
    for (var value in listCoffee) {
      total += value.price;
    }
    valueShoppingCart.value = total;
  }

  void sendOrder() async {
    isLoading.value = true;
    for (var coffee in listCoffee) {
      await removeCoffeeCart(coffee);
    }
    await getListCoffeeCart();
    valueCart();
    isLoading.value = false;
  }
}
