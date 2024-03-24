import 'package:animate_do/animate_do.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:stockeep/features/authentication/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/features/authentication/presentation/views/widgets/custom_TF.dart';
import 'package:stockeep/features/authentication/presentation/views/widgets/custom_button.dart';

class Login_View extends StatelessWidget {
  Login_View({super.key});

  final emailController = TextEditingController();
  bool loading = false;
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            print(state.user.token);
            print("success");
            loading = false;
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
  borderRadius: 8

);
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
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                      Flexible(
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1200),
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                    width: 231,
                                    height: 66,
                                  )))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.11,
                      ),
                      FadeInDown(
                          duration: Duration(milliseconds: 1600),
                          child: Text(
                            'Welcome Back ',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      FadeInDown(
                          duration: const Duration(milliseconds: 1800),
                          child: const Text(
                            'Login to access your account',
                            style: TextStyle(
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
                          if (!EmailValidator.validate(value) ) {
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
                      const Text('Forget Password ?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0xff888888), fontSize: 14)),
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
                          content: const Text('Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.17,
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
