import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stockeep/data/repo/Home_repoimpl.dart';

part 'home_state.dart';

class GetchapitreCubit extends Cubit<GetchapitreState> {
  GetchapitreCubit({required this.homerepoimpl}) : super(GetchapitreInitial());
  Homerepoimpl homerepoimpl;
 
 Future<void> getdata(String token) async{
 
emit(Getchapitreloading()) ;
var result= await homerepoimpl.getchapitre(token) ;
result.fold((l) => emit(GetchapitreFailure(l.message)), (r) {
   Map<String,int> chaplist={};
      for (var element in r) {
           chaplist.addAll({element.libelle: element.id});
         }
   emit(GetchapitreSuccess(chaplist) ) ;
    });



 }
}
