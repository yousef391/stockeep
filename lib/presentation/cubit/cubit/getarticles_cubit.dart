import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stockeep/data/models/Articles.dart';

import 'package:stockeep/data/repo/Home_repoimpl.dart';

part 'getarticles_state.dart';

class GetarticlesCubit extends Cubit<GetarticlesState> {
  GetarticlesCubit({required this.homerepoimpl}) : super(GetarticlesInitial());
  Homerepoimpl homerepoimpl;
  Future<void> getdata(String token, List<int> chapitres_ids) async {
    emit(Getarticlesloading());
    var result = await homerepoimpl.getarticle(token, chapitres_ids);
    result.fold((l) => emit(GetarticlesFailure(l.message)), (r) {
      Map<int, Article> articleslist = {};
      for (var element in r) {
        articleslist.addAll({element.id: element});
      }

      emit(GetarticlesSuccess(articleslist));
    });
  }
}
