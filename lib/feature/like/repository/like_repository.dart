abstract class IlikeRepository {
  Future<bool> postLike();
}

class LikeRepository implements IlikeRepository {
  @override
  Future<bool> postLike() async {
    await Future.delayed(const Duration(
      milliseconds: 2000,
    ));
    return true;
  }
}
