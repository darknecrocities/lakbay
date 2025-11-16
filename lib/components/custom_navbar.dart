import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF27533E),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 0),
            _navItem(Icons.explore, 1),
            _navItem(Icons.person, 2),
            _navItem(Icons.favorite, 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: SizedBox(
        width: 60, // fixed width
        height: 60, // fixed height
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutBack,
            padding: EdgeInsets.all(isSelected ? 10 : 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFCFE5AA) : Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ]
                  : [],
            ),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 250),
              scale: isSelected ? 1.15 : 1.0, // slightly smaller to prevent overflow
              curve: Curves.easeOut,
              child: Icon(
                icon,
                size: 26,
                color: isSelected ? const Color(0xFF026E55) : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
