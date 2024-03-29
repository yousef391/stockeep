import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';


// ignore: must_be_immutable
class custombottombar extends StatelessWidget {
  custombottombar(
      {super.key, required this.selectedIndex, required this.onselect});
  int selectedIndex;
  void Function(int) onselect;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 10,
      left: 10,
      child: CustomNavigationBar(
        backgroundColor: Color(0xff2185D5).withOpacity(0.9),
        borderRadius: Radius.circular(30),
        currentIndex: selectedIndex,
        onTap: onselect,
        items: [
          CustomNavigationBarItem(
              icon: Icon(
                IconlyLight.home,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                IconlyBold.home,
                color: Colors.white,
              ),
              selectedTitle: Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
          CustomNavigationBarItem(
              icon: Icon(
                IconlyLight.chart,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                IconlyBold.chart,
                color: Colors.white,
              ),
              selectedTitle: Text(
                'chart',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
          CustomNavigationBarItem(
              icon: Icon(
                IconlyLight.bag,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                IconlyBold.bag,
                color: Colors.white,
              ),
              selectedTitle: Text(
                'carte',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
          CustomNavigationBarItem(
              icon: Icon(
                IconlyLight.document,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                IconlyBold.document,
                color: Colors.white,
              ),
              selectedTitle: Text(
                'tracking',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
        ],
      ),
    );
  }
}
