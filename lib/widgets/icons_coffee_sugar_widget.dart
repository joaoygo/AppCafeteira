import 'package:cafeteira/shared/constants/assets_constants.dart';
import 'package:cafeteira/widgets/square_with_line_outlined_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsCoffeeSugarWidget extends StatelessWidget {
  final String quantitySugar;
  final void Function(int size) onTap;
  const IconsCoffeeSugarWidget({
    super.key,
    required this.quantitySugar,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onTap(0),
          child: SquareWithLineOutlinedWidget(
            color: quantitySugar == '0'
                ? const Color(0xff2d140d)
                : const Color(0xffc69a80),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GestureDetector(
            onTap: () => onTap(1),
            child: SvgPicture.asset(
              AssetsConstants.squareOutlined,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.02,
              colorFilter: ColorFilter.mode(
                quantitySugar == '1'
                    ? const Color(0xff2d140d)
                    : const Color(0xffc69a80),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () => onTap(2),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsConstants.squareOutlined,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.02,
                  colorFilter: ColorFilter.mode(
                    quantitySugar == '2'
                        ? const Color(0xff2d140d)
                        : const Color(0xffc69a80),
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  AssetsConstants.squareOutlined,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.02,
                  colorFilter: ColorFilter.mode(
                    quantitySugar == '2'
                        ? const Color(0xff2d140d)
                        : const Color(0xffc69a80),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTap(3),
          child: Column(
            children: [
              SvgPicture.asset(
                AssetsConstants.squareOutlined,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.02,
                colorFilter: ColorFilter.mode(
                  quantitySugar == '3'
                      ? const Color(0xff2d140d)
                      : const Color(0xffc69a80),
                  BlendMode.srcIn,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsConstants.squareOutlined,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.02,
                    colorFilter: ColorFilter.mode(
                      quantitySugar == '3'
                          ? const Color(0xff2d140d)
                          : const Color(0xffc69a80),
                      BlendMode.srcIn,
                    ),
                  ),
                  SvgPicture.asset(
                    AssetsConstants.squareOutlined,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.02,
                    colorFilter: ColorFilter.mode(
                      quantitySugar == '3'
                          ? const Color(0xff2d140d)
                          : const Color(0xffc69a80),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
