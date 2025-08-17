import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/file_cubit.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/di.dart';
import 'package:testtree/feature/home/setting/views/upload_page.dart';

class UploadPageProvider extends StatelessWidget {
  const UploadPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final FileCubit fileCubit = getIt.get();
    final TreeCubit treeCubit = getIt.get();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: fileCubit),
        BlocProvider.value(value: treeCubit),
      ],
      child: UploadPage(),
    );
  }
}
