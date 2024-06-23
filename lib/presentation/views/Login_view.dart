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

import 'package:stockeep/core/utils/Gotouter.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';

import 'package:stockeep/presentation/views/widgets/custom_TF.dart';
import 'package:stockeep/presentation/views/widgets/custom_button.dart';

// ignore: must_be_immutable
class Login_View extends StatefulWidget {
  Login_View({super.key});

  @override
  State<Login_View> createState() => _Login_ViewState();
}

class _Login_ViewState extends State<Login_View> {
  final emailController = TextEditingController();

  bool loading = false;

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            loading = false;
            GoRouter.of(context).push(routerapp.HomePath);
          }
          if (state is AuthLoginloading) {
            loading = true;
          }
          if (state is AuthLoginFailure) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      FadeInDown(
                        duration: Duration(milliseconds: 1400),
                        child: Image.asset(
                          fit: BoxFit.fill ,
                          'assets/images/logo.png',
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      FadeInDown(
                          duration: Duration(milliseconds: 1600),
                          child:   Text(
                            'Welcome Back ',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      FadeInDown(
                          duration: const Duration(milliseconds: 1800),
                          child:  Text(
                            'Login to access your account',
                            style: GoogleFonts.poppins().copyWith(
                                color: Color(0xff888888), fontSize: 14),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      custom_TF(
                        controller: emailController,
                        hint: 'Enter your email',
                        password: false,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'void informations';
                          }
                          if (!EmailValidator.validate(value) || !value.contains('esi-sba.dz') ) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      custom_TF(
                        controller: passwordController,
                        hint: 'Enter your Password',
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
                              BlocProvider.of<AuthCubit>(context).login(
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                          color: const Color(0xff2185D5),
                          content:  Text('Login',
                              style: GoogleFonts.poppins().copyWith( fontSize: 16,
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
          );
        },
      ),
    );
  }
}
