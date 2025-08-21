import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/di.dart';
import 'package:testtree/feature/home/setting/views/history_page.dart';

class HistoryPageProvider extends StatelessWidget {
  const HistoryPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final TreeCubit treeCubit = getIt.get();
    return BlocProvider.value(value: treeCubit, child: HistoryPage());
  }
}
