import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stockeep/data/models/BCI.dart';
import 'package:stockeep/data/repo/Home_repoimpl.dart';

part 'get_bcis_state.dart';

class GetBcisCubit extends Cubit<GetBcisState> {
  GetBcisCubit(this.homerepoimpl) : super(GetBcisInitial());

  Homerepoimpl homerepoimpl;
  Future<void> getdata(String token, String consid) async {
    emit(GEtBcisloading());
    var result = await homerepoimpl.getBcis(token, consid );
    result.fold((l) => emit(
      GEtBcisfailure(l.message)), (r) {
    
      emit(GEtBcisSucces(r));
    });
  }

  

    Future<void> deletedata(BCi bci ,String token, String consid) async {
    
    emit(Deletebciloading());
    
    var result = await homerepoimpl.deleteBci(bci , token);
   emit(Deletebciloading());
   if (result != null) {
    emit(Deletebcifailure());
   } else {
    getdata(token, consid);
   }

  }
}
