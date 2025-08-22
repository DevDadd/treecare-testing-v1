import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtree/router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/background.png', fit: BoxFit.cover),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _searchBarContainer(context),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "What would you like to do?",
                style: GoogleFonts.cairo(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 12),

            _optionCard(
              icon: Icons.health_and_safety,
              iconColor: Colors.red,
              bgColor: Colors.red.shade50,
              title: "Identify Disease",
              subtitle: "Diagnose tree health issues",
              onTap: () {
                context.push(AppRouteConstant.myHomePage);
              },
            ),
            _optionCard(
              icon: Icons.nature,
              iconColor: Colors.green,
              bgColor: Colors.green.shade50,
              title: "My Trees",
              subtitle: "Track your tree collection",
              onTap: () {
                context.push(AppRouteConstant.historypage);
              },
            ),
            _optionCard(
              icon: Icons.lightbulb_outline,
              iconColor: Colors.orange,
              bgColor: Colors.orange.shade50,
              title: "Care Tips",
              subtitle: "Expert advice & guidance",
              onTap: () {},
            ),

            _learnMoreCard(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

Widget _searchBarContainer(BuildContext context) {
  return Container(
    height: 48,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: const Color(0xFFF9FAFB),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Row(
      children: [
        const Icon(Icons.search, color: Colors.grey, size: 20),
        const SizedBox(width: 8),
        const Expanded(
          child: TextField(
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: "Search tree or disease...",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _optionCard({
  required IconData icon,
  required Color iconColor,
  required Color bgColor,
  required String title,
  required String subtitle,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _learnMoreCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text + button (left)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Keep your trees healthy and thriving!",
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Get personalized care recommendations for your trees",
                  style: GoogleFonts.cairo(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22C55E), // green
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {
                    // TODO: navigate
                  },
                  child: Text(
                    "Chatbot",
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.park, size: 50, color: Color(0xFF22C55E)),
        ],
      ),
    ),
  );
}
