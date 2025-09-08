import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/user_cubit.dart';
import 'package:testtree/di.dart';
import 'package:testtree/feature/home/setting/views/profile_page.dart';

class ProfilePageProvider extends StatelessWidget {
  const ProfilePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = getIt.get();
    final TreeCubit treeCubit = getIt.get();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: userCubit),
        BlocProvider.value(value: treeCubit,)
      ],
      child: ProfilePage(),
    );
  }
}
