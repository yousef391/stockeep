import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:stockeep/presentation/cubit/cubit/addbci_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/views/widgets/CustomStep.dart';

// ignore: must_be_immutable
class Trackingview extends StatefulWidget {
  Trackingview({super.key , required this.bciid});
final bciid;
  @override
  State<Trackingview> createState() => _TrackingviewState();
  
}

class _TrackingviewState extends State<Trackingview> {
 bool loading=false;
@override
  void initState()  {
    BlocProvider.of<AddbciCubit>(context).getbci(BlocProvider.of<AuthCubit>(context).user!.token , widget.bciid);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddbciCubit, AddbciState>(
      listener: (context, state) {
        print(state);
      
      
          if (state is Addbcifailure) {
            loading = false;
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title: state.message,
                confirmBtnText: 'Ok',
                confirmBtnColor: Color(0xff2185D5),
                borderRadius: 8);
          }
      },
      
      builder: (context, state) {
        if (state is GEtBciSucces) {
          var step=1;
           switch (state.bci.status) {
      case 'Created succesfully':step=1;
      case 'Validated by the responsable':step=2;
      case 'Validated by the director':step=3;
      case 'Delivered':step=4;
       
        
        break;
      default:
    }

    return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Order N°${state.bci.id}',
                style: GoogleFonts.poppins()
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  GoRouter.of(context).pop();

                },
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      Lottie.asset('assets/jsonn.json',
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.3),
                      Text(
                        state.bci.date,
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('${state.bci.type} request ',
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            stepp(
                              title: 'Created succesfully',
                              selected: step >= 1,
                            ),
                            stepp(
                              title: 'Validated by the responsable',
                              selected: step >= 2,
                            ),
                            stepp(
                              title: 'Validated by the director',
                              selected: step >= 3,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                          color: step == 4
                                              ? Colors.green
                                              : Colors.grey)),
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width *
                                        0.045,
                                    backgroundColor:
                                        step == 4 ? Colors.green : Colors.grey,
                                  ),
                                ),
                                Text("Delivered",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
        }  else {
          return Scaffold(
            body: Center(
              child: ModalProgressHUD(
            blur: 20,
            child: Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: Color(0xff2185D5),
                size: 80,
              ),
            ),
            inAsyncCall: loading,
            ),
          ));
        }
        
      },
    );
  }
}
