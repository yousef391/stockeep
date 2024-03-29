import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class custom_appBar extends StatelessWidget {
  const custom_appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.bars,
              size: 20,
            )),
        Flexible(
            child: Image.asset(
          'assets/images/logo.png',
          width: 119,
          height: 35,
        )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.bell,
              size: 22,
            ))
      ],
    );
  }
}
