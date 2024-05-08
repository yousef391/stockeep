import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stockeep/data/models/Product.dart';
import 'package:stockeep/data/repo/Home_repoimpl.dart';

part 'getproducts_state.dart';

class GetproductsCubit extends Cubit<GetproductsState> {
  GetproductsCubit({ required this.homerepoimpl}) : super(GetproductsInitial());

  Homerepoimpl homerepoimpl;
  Future<void> getdata(String token, List<int>? products_ids) async {
    
    emit(Getproductsloading());
    var result = await homerepoimpl.getproducts(token, products_ids);
    result.fold((l) => emit(GetproductsFailure(l.message)), (r) {
      emit(GetproductsSuccess(r));
    });
  }

  Future<void> getproductsbyfirstletters(String token, String firstletters) async {
    
    emit(Getproductsloading());
    var result = await homerepoimpl.getproductsbyfirstletters(token, firstletters);
    result.fold((l) => emit(GetproductsFailure(l.message)), (r) {
      emit(GetproductsSuccess(r));
    });
  }
}
