import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:stockeep/features/authentication/presentation/views/widgets/custom_TF.dart';
import 'package:stockeep/features/authentication/presentation/views/widgets/custom_button.dart';


class Login_View extends StatelessWidget {
  const Login_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff2185D5).withOpacity(0.4),Colors.white.withOpacity(0.4),Colors.white.withOpacity(0.4),  Color(0xff2185D5).withOpacity(0.3)])),
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.12,),
              
              Flexible(child: FadeInUp(duration: Duration(milliseconds: 1200) , child: FittedBox(fit: BoxFit.fill, child: Image.asset('assets/images/logo.png',width: 231, height: 66, )))),
              SizedBox(height: MediaQuery.of(context).size.height*0.11,),
              FadeInUp(duration: Duration(milliseconds: 1600) ,child: Text('Welcome Back ' ,style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold) ,)),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              FadeInUp(duration: Duration(milliseconds: 1800) ,child: Text('Login to access your account' ,style: TextStyle(color: Color(0xff888888 ) ,fontSize: 14),)),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              custom_TF(hint: 'Enter your email'),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              custom_TF(hint: 'Enter your Password'),
              SizedBox(height: MediaQuery.of(context).size.height*0.02 ,),
              Text('Forget Password ?' , textAlign: TextAlign.right, style: TextStyle(color: Color(0xff888888 ) ,fontSize: 14)),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              custom_button(color: Color(0xff2185D5), content: Text('Login' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold ,color: Colors.white))) ,
              SizedBox(height: MediaQuery.of(context).size.height*0.17 ,)
      
      
            ],
          ),
        ),
      ),
    );
  }
}