import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:stockeep/const.dart';
import 'package:stockeep/data/models/Notification.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/notif_cubit.dart';
import 'package:stockeep/presentation/views/widgets/Cardshimmer.dart';

class Notification_View extends StatelessWidget {
  const Notification_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor:  primarycolor  ,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins()
              .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: BlocConsumer<NotifCubit, NotifState>(
          builder: (context, state) {
            if (state is NotifSucces) {

       return   state.notiflist.isEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Lottie.asset('assets/bell.json' , height: MediaQuery.of(context).size.height*0.2),
        SizedBox(height: 30,),
        Center(child: Text('There no notifications !' , style: GoogleFonts.poppins().copyWith(fontSize: 20 ),))
       ],) : ListView.builder(
            itemCount: state.notiflist.length,
            itemBuilder: (BuildContext context, int index) {
        return Notification_item(notification_data: state.notiflist[index],);
            },
          );
        } else {
           return   ListView.builder(
        itemCount: 6,
        itemBuilder: (context, int index) {
          return Cardshimmer();
        });
        }
          }, listener: (BuildContext context, NotifState state) {  },
        ),
      ),
    );
  }
}

class Notification_item extends StatelessWidget {
   Notification_item({
    super.key,
    required this.notification_data
  });
Notif notification_data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: MediaQuery.of(context).size.height*0.13,
        child: ListTile(

          onTap: () => BlocProvider.of<NotifCubit>(context).readnot(notification_data.id,
                                BlocProvider.of<AuthCubit>(context)
                                    .user!
                                    .token , BlocProvider.of<AuthCubit>(context).user!.id ) ,
         
          contentPadding: const EdgeInsets.only( right: 7 , left: 10 ),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent)),
          tileColor:  notification_data.read_status ? Colors.grey.withOpacity(0.3) : const Color(0xff66C397).withOpacity(0.4),
          leading: Container(
  
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    strokeAlign: BorderSide.strokeAlignInside,
                    color: Colors.transparent)),
            child: CircleAvatar(
              radius: 14,
              foregroundColor: Colors.transparent,
              backgroundColor: Color(0xff66C397),
              child: Center(
                child: Icon(FontAwesomeIcons.check,
                    size: MediaQuery.of(context).size.width * 0.048,
                    color: Colors.white),
              ),
            ),
          ),
          title: Text(
            notification_data.title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: notification_data.read_status ? Colors.grey : Color(0xff66C397)
                ),
          ),
          subtitle: Text(
              notification_data.message,
              style: TextStyle(
                fontSize: 12,
              )),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             IconButton(onPressed: (){
              BlocProvider.of<NotifCubit>(context).deletenot(notification_data.id,
                                BlocProvider.of<AuthCubit>(context)
                                    .user!
                                    .token , BlocProvider.of<AuthCubit>(context).user!.id );
             },
              icon:  Icon(
                FontAwesomeIcons.xmark,
                size: 20,
              ),),

             
              Flexible(
                child: Text(
                  
                  'at ${notification_data.time.substring(5,10)}',
                  style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.visible,
                            maxLines: 1,
                 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
