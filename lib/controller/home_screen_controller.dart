import 'package:cafeteira/models/coffee_model.dart';
import 'package:cafeteira/repositories/coffee_repository.dart';

class HomeScreenController {
  final CoffeeRepository _coffeeRepository = CoffeeRepository();

  Future<List<CoffeeModel>> getListCoffee() async {
    return await _coffeeRepository.getListCoffee();
  }
}
