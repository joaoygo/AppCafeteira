import 'dart:convert';

import 'package:cafeteira/models/coffee_model.dart';
import 'package:cafeteira/viewModel/coffee_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CoffeeRepository {
  String urlBaseAPI = const String.fromEnvironment('URL_BASE_API');

  Future<List<CoffeeModel>> getListCoffee() async {
    try {
      final Uri url = Uri.parse('${urlBaseAPI}items');
      final response = await http.get(url);
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap.map((res) => CoffeeModel.fromMap(res)).toList();
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<List<CoffeeViewModel>> getListCoffeeCart() async {
    try {
      final Uri url = Uri.parse('${urlBaseAPI}cart');
      final response = await http.get(url);
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap.map((res) => CoffeeViewModel.fromMap(res)).toList();
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<void> addCoffee(CoffeeViewModel coffee) async {
    try {
      final Uri url = Uri.parse('${urlBaseAPI}cart');
      await http.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: coffee.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeCoffeeCart(CoffeeViewModel coffee) async {
    try {
      final Uri url = Uri.parse('${urlBaseAPI}cart/${coffee.idItem}');
      await http.delete(url);
    } catch (e) {
      rethrow;
    }
  }
}
