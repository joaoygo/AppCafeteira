import 'package:cafeteira/controller/details_coffee_controller.dart';
import 'package:cafeteira/models/coffee_model.dart';
import 'package:cafeteira/shared/constants/assets_constants.dart';
import 'package:cafeteira/view/shopping_cart_view.dart';
import 'package:cafeteira/widgets/icons_coffee_size_widget.dart';
import 'package:cafeteira/widgets/icons_coffee_sugar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailCoffeeView extends StatefulWidget {
  final CoffeeModel selectCoffee;

  const DetailCoffeeView({super.key, required this.selectCoffee});

  @override
  State<DetailCoffeeView> createState() => _DetailCoffeeViewState();
}

class _DetailCoffeeViewState extends State<DetailCoffeeView> {
  final DetailsCoffeeController _controller = DetailsCoffeeController();

  @override
  void initState() {
    _controller.setValueBaseCoffee(widget.selectCoffee.basePrice.toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Preferences',
            style: TextStyle(color: Color(0xffc69a80)),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: SvgPicture.asset(
                        AssetsConstants.backgroundSplashScreenPage,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: const Color(0xfff8e8d4).withOpacity(0.93),
                    ),
                    Positioned.fill(
                      bottom: MediaQuery.of(context).size.height * 0.03,
                      top: MediaQuery.of(context).size.height * 0.03,
                      child: SvgPicture.asset(
                        '${AssetsConstants.baseAssets}${widget.selectCoffee.name.toLowerCase()}.svg',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.selectCoffee.name,
                        style: const TextStyle(
                            color: Color(0xffc69a80),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Row(
                        children: [
                          Text('${_controller.coffeeQuantity.value}'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () =>
                                  _controller.incrementCoffeeQuantity(),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                                child: const Center(child: Text('+')),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _controller.decrementCoffeeQuantity(),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              child: const Center(child: Text('-')),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 30.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 100.0),
                        child: SizedBox(width: 50, child: Text('Size')),
                      ),
                      IconsCoffeeSizeWidget(
                        coffeeName: widget.selectCoffee.name,
                        sizeCoffee: '${_controller.sizeCoffee}',
                        onTap: (size) => _controller.setSizeCoffee(size),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 100.0),
                        child: SizedBox(width: 50, child: Text('Sugar')),
                      ),
                      IconsCoffeeSugarWidget(
                        quantitySugar: _controller.quantitySugar.value,
                        onTap: (size) => _controller.setQuantitySugar(size),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: MediaQuery.of(context).size.height * 0.3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xffc69a80)),
                      ),
                      Text(
                        '\$ ${_controller.coffeeValue.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff2d140d)),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                if (_controller.quantitySugar.value != '' &&
                                    _controller.sizeCoffee.value != '') {
                                  _controller
                                      .addToCart(widget.selectCoffee.name);
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'Success',
                                    message: 'Order added',
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
                                  color: _controller.quantitySugar.value ==
                                              '' ||
                                          _controller.sizeCoffee.value == ''
                                      ? const Color.fromARGB(127, 207, 152, 117)
                                      : const Color(0xffcf9775),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white),
                                )),
                              )),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ShoppingCartView(),
                                )),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xffcf9775),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
