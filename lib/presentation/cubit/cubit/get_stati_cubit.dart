import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stockeep/data/repo/Home_repoimpl.dart';

part 'get_stati_state.dart';

class GetStatiCubit extends Cubit<GetStatiState> {
  GetStatiCubit(this.homerepoimpl) : super(GetStatiInitial());

   Homerepoimpl homerepoimpl;
  Future<void> getdata(String token, String consid) async {
    emit(GetStatiloading());
    var result = await homerepoimpl.getstatistics(token, consid );
    result.fold((l) => emit(
     GetStatiFailure(l.message)), (r) {
    
      emit(GetStatisucces(r));
    });
  }
}
