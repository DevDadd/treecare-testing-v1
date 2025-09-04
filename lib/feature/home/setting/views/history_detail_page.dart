import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/tree_state.dart';
import 'package:testtree/model/tree.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({super.key, required this.treeId});
  final int treeId;

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TreeCubit>().getTree(widget.treeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TreeCubit, TreeState>(
        builder: (context, state) {
          final tree = state.treeResult;
          return Column(
            children: [
              if (tree?.imageUrl != null && tree!.imageUrl!.isNotEmpty)
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    tree.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
                )
              else
                const Icon(Icons.image_not_supported, size: 50),
            ],
          );
        },
      ),
    );
  }
}
