import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/tree_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TreeCubit, TreeState>(
        builder: (context, state) {
       if (state.treeHistory.isEmpty) {
            return const Center(
              child: Text("No history yet"),
            );
          }
          return ListView.builder(itemCount: state.treeHistory.length,itemBuilder: (context,index){
            return ListTile(
              leading: Image.network(state.treeHistory[index].imageUrl ?? " "),
              title: Text(state.treeHistory[index].species ?? " "),
              subtitle: Text(state.treeHistory[index].disease ?? " "),
            );
          });
        },
      ),
    );
  }
}