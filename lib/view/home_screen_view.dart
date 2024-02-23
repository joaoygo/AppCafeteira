import 'package:cafeteira/controller/home_screen_controller.dart';
import 'package:cafeteira/shared/constants/assets_constants.dart';
import 'package:cafeteira/view/detail_coffee_view.dart';
import 'package:cafeteira/widgets/card_max_width_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  HomeScreenView({super.key});
  final HomeScreenController _controller = HomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(color: Color(0xffc69a80)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: _controller.getListCoffee(),
          initialData: const [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color(0xffc69a80),
              ));
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: CardMaxWidthWidget(
                          iconLeft:
                              '${AssetsConstants.baseAssets}${snapshot.data?[index].name.toLowerCase()}.svg',
                          text: snapshot.data?[index].name,
                          iconRight: Icons.arrow_forward_ios_rounded,
                          iconColor: const Color(0xffc69a80),
                          ontap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailCoffeeView(
                                    selectCoffee: snapshot.data?[index]),
                              )),
                        ),
                      ));
            }
          },
        ),
      ),
    );
  }
}
