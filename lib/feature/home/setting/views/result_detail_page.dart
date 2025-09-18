import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/tree_state.dart';
import 'package:testtree/router/go_router.dart';

class ResultDetailPage extends StatelessWidget {
  const ResultDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == ThemeMode.dark
          ? Colors.white
          : const Color.fromARGB(255, 28, 28, 37),

      body: BlocBuilder<TreeCubit, TreeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ảnh lớn trên cùng
                Container(
                  height: size.height * 0.35,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Image.network(
                    state.treeResult!.imageUrl ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),

                // Tên cây
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    state.treeResult!.species ?? " ",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 2),

                // Bệnh
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: Text(
                        "Diseases Detected:",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        state.treeResult!.disease ?? " ",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Card hiển thị kết quả + ảnh + icon overlay
                Center(
                  child: Container(
                    height: size.height * 0.23,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 56, 59, 65),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      children: [
                        // Bên trái: text + nút
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Your plant ",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "looks sick",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Get a custom treatment plan to cure your plant.",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {
                                    context.push(
                                      AppRouteConstant.myHomePage,
                                      extra: 2,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF00E1A0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    "Get treatment plan",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  state.treeResult!.imageUrl ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    "assets/alert.png",
                                    height: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                Center(
                  child: SizedBox(
                    width: size.width * 0.9, // full width of the parent
                    height: size.height * 0.08, // 👈 control height here
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<TreeCubit>().addHistory(state.treeResult!);
                        context.push(AppRouteConstant.myHistoryPage);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00E1A0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // round
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Save to your tree collection",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18, // make text a bit larger
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
