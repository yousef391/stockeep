import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:stockeep/data/repo/Authrepoimpl.dart';

import '../../../data/models/UserM.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authrepo}) : super(AuthInitial());
  Authrepoimpl authrepo;
  UserM? user;

  Future<void> login(String email, String password) async {
    emit(AuthLoginloading());

    var result = await authrepo.login(email, password);

    result.fold((l) => emit(AuthLoginFailure(l.message)), (r) {
      user = r;
      emit(AuthLoginSuccess(r));
    });
  }

    Future<void> changepassword(String token, String old_password , String new_passowrd) async {
    emit(Changepassloading());

    var result = await authrepo.changepassword(token, old_password , new_passowrd);

    result.fold((l) => emit(ChangepassFailure(l.message)), (r) {
      
      emit(ChangepassSuccess(r));
    });
  }

  Future<bool> getuser(String token, int id) async {
    emit(AuthLoginloading());
    var verify= await authrepo.Verifytoken(token);
    print(verify);
    if(verify) {
       var result = await authrepo.getuser(token, id);

    result.fold((l) => emit(AuthLoginFailure(l.message)), (r) {
      user = r;

      emit(AuthLoginSuccess(r));
    });

    }
    return verify;

   
   
  }


}
