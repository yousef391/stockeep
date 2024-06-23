import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockeep/presentation/cubit/cubit/get_bcis_cubit.dart';
import 'package:stockeep/presentation/views/widgets/Cardshimmer.dart';


import 'package:stockeep/presentation/views/widgets/Order_item.dart';

class OrderView extends StatefulWidget {
  OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        BlocConsumer<GetBcisCubit, GetBcisState>(
          listener: (BuildContext context, GetBcisState state) {  },
          builder: (context, state) {
            
            if (state is GEtBcisSucces) {
             
  return SliverList.builder(
      itemCount: state.bcis.length,
      itemBuilder: (context, int index) {
        return Order_item(bci: state.bcis[index],);
      });
} else{
            return   SliverList.builder(
      itemCount: 6,
      itemBuilder: (context, int index) {
        return Cardshimmer();
      });
          }
          },  
          
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
          ),
        )
      ],
    );
  }
}
