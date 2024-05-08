import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:stockeep/core/utils/Gotouter.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/views/Cardview.dart';
import 'package:stockeep/presentation/views/Oderview.dart';
import 'package:stockeep/presentation/views/widgets/Customuserinfotail.dart';

import 'package:stockeep/presentation/views/widgets/Home_body.dart';

import 'package:stockeep/presentation/views/widgets/custombuttombar.dart';

class Home_view extends StatefulWidget {
  Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  int selectedIndex = 0;
  PageController controller=PageController();
bool dark=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer : Drawer(
      clipBehavior: Clip.antiAlias,
      
      width: MediaQuery.of(context).size.width*0.8,
      child: Column(children: [
       const SizedBox(height: 15,),
        customuserinfotail(img: BlocProvider.of<AuthCubit>(context).user!.image, subtitle: BlocProvider.of<AuthCubit>(context).user!.email , title: '${BlocProvider.of<AuthCubit>(context).user!.first_name} ${BlocProvider.of<AuthCubit>(context).user!.last_name} ' ),
      const   SizedBox(height: 40,) ,
      const  ListTile(title: Text('Home'), leading: Icon(IconlyLight.home , size: 21,),),
      GestureDetector(child:   ListTile(title: Text('Settings'), leading: Icon(IconlyLight.setting , size: 21,),) , onTap: () => GoRouter.of(context).push(routerapp.KSettings) ,),
      GestureDetector(child: const  ListTile(title: Text('Contact us'), leading: Icon(IconlyLight.call , size: 21,),)),
      const  Expanded(child: SizedBox(),) ,
       Switch(
      // This bool value toggles the switch.
      value: !dark,
      thumbIcon: dark ? MaterialStatePropertyAll<Icon>(Icon(FontAwesomeIcons.sun ,color: Colors.yellow,) )  :MaterialStatePropertyAll<Icon>(Icon(FontAwesomeIcons.moon ,color: Colors.blue[900],) ) ,
      
      trackColor:!dark ? MaterialStatePropertyAll<Color>(Colors.black) :  MaterialStatePropertyAll<Color>(Colors.yellow)  ,
      thumbColor: const MaterialStatePropertyAll<Color>(Colors.white),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          dark= !dark;
        });
      },
    ),
       SizedBox(height: 50,)

      ])),
        appBar: AppBar(
          
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
         
          
          title: Image.asset(
                      'assets/images/logo.png',
                      width: 119,
                      height: 35,
                    ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.bell,
                  size: 22,
                ))
          ],
        ),
       
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                 Home_body(),
                 Home_body(),
                  CardView(),
                  OrderView()
              
                ],
              ) ,

              custombottombar(
                onselect: (int index) {
                  setState(() {
                    
                    selectedIndex = index;
                    controller.jumpToPage(index);
                  });
                },
                selectedIndex: selectedIndex,
              ),
            ],
          ),
        ));
  }
}










