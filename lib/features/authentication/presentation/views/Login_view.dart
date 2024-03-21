import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockeep/features/authentication/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/features/authentication/presentation/views/widgets/custom_TF.dart';
import 'package:stockeep/features/authentication/presentation/views/widgets/custom_button.dart';

class Login_View extends StatefulWidget {
  const Login_View({super.key});

  @override
  State<Login_View> createState() => _Login_ViewState();
}

class _Login_ViewState extends State<Login_View> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
         if (state is AuthLoginSuccess) {
           print(state.token);
         }
         if (state is AuthLoginFailure) {
           print('error');
         }
          if (state is AuthLoginloading) {
           print('errorloading');
         }
        },
        builder: (context, state) {
          return Container(
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
                  FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: Text(
                        'Welcome Back ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Text(
                        'Login to access your account',
                        style:
                            TextStyle(color: Color(0xff888888), fontSize: 14),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  custom_TF( controller: emailController,hint: 'Enter your email'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  custom_TF(controller: passwordController,hint: 'Enter your Password'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text('Forget Password ?',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Color(0xff888888), fontSize: 14)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  custom_button(
                    ontap: (){
                      BlocProvider.of<AuthCubit>(context).login(emailController.text,passwordController.text);

                    },
                      color: Color(0xff2185D5),
                      content: Text('Login',
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
          );
        },
      ),
    );
  }
}
