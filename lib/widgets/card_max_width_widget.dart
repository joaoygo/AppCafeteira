import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardMaxWidthWidget extends StatelessWidget {
  final String iconLeft;
  final String text;
  final IconData iconRight;
  final Color? iconColor;
  final void Function()? ontap;

  const CardMaxWidthWidget(
      {Key? key,
      required this.iconLeft,
      required this.text,
      required this.iconRight,
      this.iconColor = Colors.black,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconLeft,
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Icon(
              iconRight,
              size: 20,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
