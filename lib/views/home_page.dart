import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/file_cubit.dart';
import 'package:testtree/cubit/file_state.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/tree_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TreeCubit, TreeState>(
        builder: (context, treeState) {
          return BlocBuilder<FileCubit, FileState>(
            builder: (context, fileState) {
              final pickedFile = fileState.file;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<FileCubit>().pickFile();
                      },
                      child: const Text("Pick Image"),
                    ),
                    const SizedBox(height: 20),

                    if (pickedFile != null && pickedFile.path != null)
                      Image.file(File(pickedFile.path!), height: 200),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: pickedFile != null && pickedFile.path != null
                          ? () async {
                              final tree = await context
                                  .read<TreeCubit>()
                                  .uploadTreeImage(File(pickedFile.path!));

                              if (tree?.treeId != null) {
                                context.read<TreeCubit>().getTree(
                                  tree!.treeId!,
                                );
                              }
                            }
                          : null,
                      child: const Text("Upload Image"),
                    ),

                    const SizedBox(height: 20),

                    if (treeState.treeResult != null)
                      Column(
                        children: [
                          Text(treeState.treeResult!.species ?? ""),
                          const SizedBox(height: 10),
                          Text(treeState.treeResult!.disease ?? ""),
                        ],
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
