import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtree/cubit/file_cubit.dart';
import 'package:testtree/cubit/file_state.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/tree_state.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5C7B70),
        leading: Icon(Icons.menu, color: Colors.white),
        centerTitle: true,
        title: Text(
          "Upload and Analyzes",
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Color(0xFFC7D7CE),
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
