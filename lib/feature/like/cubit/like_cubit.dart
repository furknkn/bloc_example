import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/like_repository.dart';
import 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  final LikeRepository _catsRepository;
  LikeCubit(this._catsRepository) : super(const LikeInit());

  Future<void> postLike() async {
    try {
      emit(const LikeLoad());
      final response = await _catsRepository.postLike();
      emit(LikeFinish(response));
    } on Exception catch (e) {
      emit(LikeError(e.toString()));
    }
  }
}
