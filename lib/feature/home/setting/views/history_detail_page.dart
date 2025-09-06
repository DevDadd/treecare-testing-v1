import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/tree_state.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({super.key, required this.treeId});
  final int treeId;

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<TreeCubit>().getTree(widget.treeId);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Your Tree Result",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
      ),
      body: BlocBuilder<TreeCubit, TreeState>(
        builder: (context, state) {
          final tree = state.treeResult;

          if (tree != null &&
              tree.imageUrl != null &&
              tree.imageUrl!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      tree.imageUrl ?? " ",
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tree.species ?? "Unknown Tree",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          tree.disease ?? "No disease detected",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "DETECTED",
                                style: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.eco,
                              color: Colors.green,
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30), // spacing at bottom
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_not_supported, size: 50),
                  SizedBox(height: 8),
                  Text("No image available"),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
