import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stockeep/data/models/BCI.dart';
import 'package:stockeep/data/repo/Home_repoimpl.dart';

part 'addbci_state.dart';

class AddbciCubit extends Cubit<AddbciState> {
   AddbciCubit(this.homerepoimpl) : super(AddbciInitial());

  Homerepoimpl homerepoimpl;
  Future<void> postdata(BCi bci) async {
    
    emit(Addbciloading());
    
    var result = await homerepoimpl.postBci(bci);
    
    result.fold((l) => emit(Addbcifailure(l.message)), (r) {
    
      emit(AddbciSucces());
    });
  }

    Future<void> getbci(String token, int bciid) async {
    emit(GEtBciloading());
    var result = await homerepoimpl.getBci(token, bciid );
    result.fold((l) => emit(
      GEtBcifailure(l.message)), (r) {
        
    print(r);
      emit(GEtBciSucces(r));
    });
  }


  
}
