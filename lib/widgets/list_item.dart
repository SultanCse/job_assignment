import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.id, required this.link}) : super(key: key);
  final String link;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.red),
        // color: Colors.white70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('id: $id', style: GoogleFonts.abel(fontSize: 24)),
          Text('Link: $link', style: GoogleFonts.abel(fontSize: 16)),
        ],
      ),
    );
  }
}
