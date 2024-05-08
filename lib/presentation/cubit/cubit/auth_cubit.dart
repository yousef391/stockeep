import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:stockeep/data/repo/Authrepoimpl.dart';

import '../../../data/models/UserM.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({ required this.authrepo}) : super(AuthInitial());
Authrepoimpl authrepo;
UserM? user;

 Future<void> login(String email , String password) async{
emit(AuthLoginloading()) ;

var result= await authrepo.login(email,password) ;

result.fold((l) => emit(AuthLoginFailure(l.message)), (r)  {
  user=r;
  emit(AuthLoginSuccess(r));
 
 
} );



 }
}


