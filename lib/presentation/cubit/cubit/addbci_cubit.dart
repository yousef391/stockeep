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
    var result = await homerepoimpl.PostBci(bci);
    result.fold((l) => emit(Addbcifailure(l.message)), (r) {
    
      emit(AddbciSucces());
    });
  }
}
