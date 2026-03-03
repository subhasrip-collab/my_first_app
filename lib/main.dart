
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 222, 24), // light green background         
      appBar: AppBar(
        title: Text(                          // ← remove const
          'My Profile',
          style: GoogleFonts.playfairDisplay( // ← Times New Roman style
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: ProfileCard(),
      ),
    ),
  );
}

}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(               // OUTER BOX
      width: 300,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(               // STACK THINGS VERTICALLY
        mainAxisSize: MainAxisSize.min, // shrink to content size
        children: [

          // ── TOP PURPLE SECTION ──
          Container(
            width: double.infinity,  // full width
            height: 100,
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),

          // ── PROFILE PICTURE ──
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,  // perfect circle
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Center(
              child: Text(
                'S',                 // first letter of name
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── NAME ──
          const Text(
            'Subhasri',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // ── LOCATION ──
          Row(                       // HORIZONTAL row for icon + text
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                'Rayagada, Odisha',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ── STATS ROW ──
          Row(                       // 3 stats side by side
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatBox(number: '208', label: 'Posts'),
              _StatBox(number: '9.2K', label: 'Followers'),
              _StatBox(number: '812', label: 'Following'),
            ],
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

// Small reusable widget for each stat
class _StatBox extends StatelessWidget {
  final String number;
  final String label;

  const _StatBox({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(                    // number on top, label below
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black12,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
