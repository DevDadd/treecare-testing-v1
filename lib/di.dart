import 'package:get_it/get_it.dart';
import 'package:testtree/cubit/chat_cubit.dart';
import 'package:testtree/cubit/file_cubit.dart';
import 'package:testtree/cubit/theme_cubit.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/user_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FileCubit>(FileCubit());
  getIt.registerSingleton<TreeCubit>(TreeCubit());
  getIt.registerSingleton<ChatCubit>(ChatCubit());
  getIt.registerSingleton<UserCubit>(UserCubit());
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());
}
