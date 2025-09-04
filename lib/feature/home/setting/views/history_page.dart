import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/tree_state.dart';
import 'package:testtree/router/go_router.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 233),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Your leaves collections",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(FontAwesomeIcons.treeCity, color: Colors.green),
          ),
        ],
      ),
      body: BlocBuilder<TreeCubit, TreeState>(
        builder: (context, state) {
          if (state.treeHistory.isEmpty) {
            return const Center(child: Text("No history yet"));
          }

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.builder(
              itemCount: state.treeHistory.length,
              itemBuilder: (context, index) {
                final item = state.treeHistory[index];
                return GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.green, // Green border
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      onTap: () {
                        context.push(AppRouteConstant.historyDetailPage,extra: item.treeId);
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.imageUrl ?? " "),
                        radius: 25,
                      ),
                      title: Text(
                        item.species ?? "Unknown species",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 48, 116, 50),
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        item.disease ?? "Unknown disease",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 48, 163, 107),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
