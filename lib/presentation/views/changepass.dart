import 'package:animate_do/animate_do.dart';

import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:stockeep/const.dart';

import 'package:stockeep/core/utils/Gotouter.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';

import 'package:stockeep/presentation/views/widgets/custom_TF.dart';
import 'package:stockeep/presentation/views/widgets/custom_button.dart';

// ignore: must_be_immutable
class Change_password extends StatefulWidget {
  Change_password({super.key});

  @override
  State<Change_password> createState() => _Change_passwordState();
}

class _Change_passwordState extends State<Change_password> {
  final oldpassController = TextEditingController();

  bool loading = false;

  final newpassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ChangepassSuccess) {
            loading = false;
                        QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                title: 'Success' ,
                confirmBtnText: 'Ok',
                confirmBtnColor: Color(0xff2185D5),
                borderRadius: 8);

                GoRouter.of(context).pop();
          }
          if (state is Changepassloading) {
            loading = true;
          }
          if (state is ChangepassFailure) {
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
          return ModalProgressHUD(
            blur: 20,
            progressIndicator: Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: Color(0xff2185D5),
                size: 80,
              ),
            ),
            inAsyncCall: loading,
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Color(0xff2185D5).withOpacity(0.4),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.4),
                        Color(0xff2185D5).withOpacity(0.3)
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
              IconButton(onPressed: () =>Navigator.of(context).pop() , icon: Icon(Icons.arrow_back)) ,
              
              SizedBox(width: MediaQuery.of(context).size.width*0.24 ,),
              Text("Setting" , style: GoogleFonts.poppins().copyWith(fontSize: 27 , fontWeight: FontWeight.bold ) ,),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                      
                      
                        FadeInDown(
                            duration: Duration(milliseconds: 1600),
                            child: const  Text(
                              'Change password',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        custom_TF(
                          controller: oldpassController,
                          hint: 'Enter Old_password',
                          password: true,
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'void informations';
                            }
                            if (value.length < 3) {
                              return 'Use at least 8 characteres';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        custom_TF(
                          controller: newpassController,
                          hint: 'Enter your New_Password',
                          password: true,
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'void informations';
                            }
                            if (value.length < 3) {
                              return 'Use at least 8 characteres';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        custom_button(
                            ontap: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).changepassword(
                                  BlocProvider.of<AuthCubit>(context).user!.token,
                                    oldpassController.text,
                                    newpassController.text);
                              }
                            },
                            color: const Color(0xff2185D5),
                            content: const Text('Confirm',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
