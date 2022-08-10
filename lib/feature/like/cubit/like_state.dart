abstract class LikeState{
  const LikeState();
}

class LikeInit extends LikeState {
  const LikeInit();
}

class LikeLoad extends LikeState {
  const LikeLoad();
}

class LikeFinish extends LikeState {
  final bool response;

  const LikeFinish(this.response);

}

class LikeError extends LikeState {
  final String message;
  const LikeError(this.message);
}