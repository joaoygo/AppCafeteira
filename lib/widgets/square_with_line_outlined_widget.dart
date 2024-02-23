import 'package:cafeteira/shared/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquareWithLineOutlinedWidget extends StatelessWidget {
  final Color color;
  //final VoidCallback onPressed;
  const SquareWithLineOutlinedWidget({
    Key? key,
    this.color = Colors.black,
    //required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: onPressed,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SvgPicture.asset(
                AssetsConstants.squareOutlined,
                width: MediaQuery.of(context).size.height * 0.03,
                height: MediaQuery.of(context).size.height * 0.03,
                colorFilter: ColorFilter.mode(
                  color,
                  BlendMode.srcIn,
                ),
              ),
              SvgPicture.asset(
                AssetsConstants.diagonalLineOutlined,
                width: MediaQuery.of(context).size.height * 0.03,
                height: MediaQuery.of(context).size.height * 0.03,
                colorFilter: ColorFilter.mode(
                  color,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
