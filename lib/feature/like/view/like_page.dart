import 'package:bloc_example/feature/like/cubit/like_state.dart';
import 'package:bloc_example/feature/like/cubit/like_cubit.dart';
import 'package:bloc_example/feature/like/repository/like_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikeCubit(LikeRepository()),
      child: scaffoldLike(context),
    );
  }

  Scaffold scaffoldLike(BuildContext context) {
    return Scaffold(
      appBar: likeAppBar(),
      body: BlocConsumer<LikeCubit, LikeState>(
          builder: (context, state) {
            if (state is LikeInit) {
              return initBody(context);
            } else if (state is LikeLoad) {
              return loadIndicator();
            } else if (state is LikeFinish) {
              return complateBody(context);
            } else {
              return errorBody(context);
            }
          },
          listener: (context, state) {}),
    );
  }

  AppBar likeAppBar() {
    return AppBar(
      title: const Text("Like Appbar"),
    );
  }

  Widget initBody(BuildContext context) {
    return Center(
      child: IconButton(
          onPressed: () => context.read<LikeCubit>().postLike(),
          icon: const Icon(Icons.handshake)),
    );
  }

  Widget loadIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget complateBody(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("İşlem başarılı"),
        IconButton(
            onPressed: () => context.read<LikeCubit>().postLike(),
            icon: const Icon(Icons.handshake)),
      ],
    ));
  }

  Widget errorBody(BuildContext context) {
    return Center(
      child: TextButton(child: const Text("Yenile"), onPressed: () {}),
    );
  }
}
