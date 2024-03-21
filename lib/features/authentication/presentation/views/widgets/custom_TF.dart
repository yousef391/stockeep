

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class custom_TF extends StatelessWidget {
   custom_TF({
    required this.hint,
    super.key,
    this.maxLines,
    this.controller
  });
  
  final hint;
  int? maxLines=1;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8 ),
      child: TextFormField(
        controller: controller ,
        validator: (value) {
          if(value==null || value=='' ) {
            return 'void informations';
          }
          if( !value.startsWith('+213') && !value.startsWith('0')  ) {
            return 'numéro inccorect' ;
          }
          return null;
        },
        maxLines: maxLines,
        
        decoration: InputDecoration(
            fillColor: const Color(0xff2185D5).withOpacity(0.1),
            hintStyle: const  TextStyle(color: Color(0xff2185D5), fontSize: 13 ,),
            filled: true,
            
            hintText: hint,
            border: borderdec(),
            enabledBorder: borderdec(),
            focusedBorder: borderdec(),
            disabledBorder: borderdec()),
      ),
    );
  }

  OutlineInputBorder borderdec() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.transparent));
  }
}