import 'package:cafeteira/controller/shopping_cart_controller.dart';
import 'package:cafeteira/view/home_screen_view.dart';
import 'package:cafeteira/widgets/card_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({super.key});

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  final ShoppingCartController _controller = ShoppingCartController();

  @override
  void initState() {
    super.initState();
    _controller.getListCoffeeCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: Color(0xffc69a80)),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => _controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffc69a80),
                ),
              )
            : Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: _controller.listCoffee.length,
                    itemBuilder: (context, index) => CardShoppingCart(
                        name: _controller.listCoffee[index].name,
                        price: _controller.listCoffee[index].price,
                        quantity: _controller.listCoffee[index].amount,
                        sugar: _controller.listCoffee[index].sugar,
                        size: _controller.listCoffee[index].size,
                        onRemove: () {
                          _controller
                              .removeCoffeeCart(_controller.listCoffee[index]);
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Success',
                            message: 'Order deleted',
                            duration: Duration(seconds: 3),
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.red,
                          ));
                        }),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'TOTAL',
                          style: TextStyle(
                              color: Color(0xffcf9775),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 2,
                          decoration:
                              const BoxDecoration(color: Color(0xff2d140d)),
                        ),
                        Text(
                          '\$ ${_controller.valueShoppingCart.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Color(0xffcf9775),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          if (_controller.valueShoppingCart.value != 0) {
                            _controller.sendOrder();

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreenView()),
                              (Route<dynamic> route) => false,
                            );

                            Get.showSnackbar(const GetSnackBar(
                              title: 'Success',
                              message: 'Sended Order',
                              duration: Duration(seconds: 3),
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.green,
                            ));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _controller.valueShoppingCart.value == 0
                                ? const Color.fromARGB(127, 207, 152, 117)
                                : const Color(0xffcf9775),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            _controller.valueShoppingCart.value == 0
                                ? 'Empty List'
                                : 'Send Order',
                            style: const TextStyle(color: Colors.white),
                          )),
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}
