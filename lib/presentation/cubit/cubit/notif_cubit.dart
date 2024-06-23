

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import 'package:stockeep/data/repo/Home_repoimpl.dart';

part 'notif_state.dart';

class NotifCubit extends Cubit<NotifState> {
  NotifCubit(this.homerepim) : super(NotifInitial());

Homerepoimpl homerepim;

Future getnot(int userid , String token) async {
  emit(NotifLoading()) ;
  var data=await homerepim.getnoti(token, userid);
  data.fold((l)=> emit(NotifFailure(l.message)) ,(r)=> emit(NotifSucces(r)) ) ;
}

Future readnot(int id , String token,int userid ) async {
  await homerepim.readnot(token, id);
  emit(NotifLoading()) ;
  var data=await homerepim.getnoti(token, userid);
  data.fold((l)=> emit(NotifFailure(l.message)) ,(r)=> emit(NotifSucces(r)) ) ;
}

Future deletenot(int id  , String token, int userid) async {
  await homerepim.deletenot(token, id);
  emit(NotifLoading()) ;
  var data=await homerepim.getnoti(token, userid);
  data.fold((l)=> emit(NotifFailure(l.message)) ,(r)=> emit(NotifSucces(r)) ) ;
}



}
