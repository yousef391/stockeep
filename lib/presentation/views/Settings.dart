import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/views/widgets/Customuserinfotail.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text("Setting" , style: GoogleFonts.poppins().copyWith(fontSize: 24 , fontWeight: FontWeight.bold ) ,),
      ),
      body: Column(
        children: [
          customuserinfotail(img: BlocProvider.of<AuthCubit>(context).user!.image , subtitle: 'Don’t tell anyone, but I’m Obito Uchiha.', title: BlocProvider.of<AuthCubit>(context).user!.first_name +BlocProvider.of<AuthCubit>(context).user!.last_name),
          SizedBox(height: 30,),
           
         
                        ListTile(title: Text('Account' , style: TextStyle(fontWeight: FontWeight.bold),), leading: Icon(IconlyBold.user_2, size: 28,),subtitle: Text('Privacy, secutrity, change email or number'),),
            SizedBox(height: 15,),
                        ListTile(title: Text('Notifications' , style: TextStyle(fontWeight: FontWeight.bold),), leading: Icon(IconlyBold.notification , size: 28,), subtitle: Text('Message, group & call tones'),),
            SizedBox(height: 15,),
                        ListTile(title: Text('Help' , style: TextStyle(fontWeight: FontWeight.bold),), leading: Icon(IconlyBold.call , size: 28,), subtitle:Text('Help cenre, contact us, privacy policy') ,),
            SizedBox(height: 15,)

        ],
      ),
    );
  }
}