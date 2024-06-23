import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stockeep/const.dart';

// ignore: must_be_immutable
class stepp extends StatelessWidget {
  stepp({
    required this.title,
    this.selected = false,
    super.key,
  });
  String title;

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      strokeAlign: BorderSide.strokeAlignInside,
                      color: selected ? Colors.transparent : Colors.black)),
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.045,
                foregroundColor: selected ? Colors.transparent : Colors.black,
                backgroundColor: selected ? primarycolor : Colors.transparent,
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.check,
                    size: MediaQuery.of(context).size.width*0.048,
                    color: selected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            Flexible(child: Text(title, style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 18) , overflow: TextOverflow.clip,)),
          ],
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.047),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 2, color: selected ? Colors.blue : Colors.grey))),
        )
      ],
    );
  }
}
