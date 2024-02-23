import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsCoffeeSizeWidget extends StatelessWidget {
  final String coffeeName;
  final String sizeCoffee;
  final void Function(String size) onTap;
  const IconsCoffeeSizeWidget({
    super.key,
    required this.coffeeName,
    required this.sizeCoffee,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var svgImage = 'assets/images/${coffeeName.toLowerCase()}.svg';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => onTap('P'),
          child: Column(
            children: [
              SvgPicture.asset(
                svgImage,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: 2,
                  color: sizeCoffee == 'P'
                      ? const Color(0xff2d140d)
                      : Colors.transparent,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GestureDetector(
            onTap: () => onTap('M'),
            child: Column(
              children: [
                SvgPicture.asset(
                  svgImage,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                    height: 2,
                    color: sizeCoffee == 'M'
                        ? const Color(0xff2d140d)
                        : Colors.transparent,
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTap('G'),
          child: Column(
            children: [
              SvgPicture.asset(
                svgImage,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: 2,
                  color: sizeCoffee == 'G'
                      ? const Color(0xff2d140d)
                      : Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
