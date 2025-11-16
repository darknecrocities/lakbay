import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffF3F3E7),
      elevation: 0,
      title: const Text(
        "Discover",
        style: TextStyle(
          fontFamily: "Fraunces",
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xff27533E),
        ),
      ),
      actions: [
        _icon(Icons.search),
        const SizedBox(width: 10),
        _icon(Icons.notifications),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget _icon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF026E55),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(icon, color: const Color(0xffCFE5AA), size: 22),
    );
  }
}
