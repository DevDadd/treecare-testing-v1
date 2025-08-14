import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/file_cubit.dart';
import 'package:testtree/cubit/tree_cubit.dart'; // example 2nd cubit
import 'package:testtree/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FileCubit>(create: (context) => FileCubit()),
        BlocProvider<TreeCubit>(create: (context) => TreeCubit()),
      ],
      child: MaterialApp(home: HomePage()),
    );
  }
}
