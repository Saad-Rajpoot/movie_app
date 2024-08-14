import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/icons/movie.png',
                height: 29,
                width: 29,
              ),
            ),
            label: '', // Empty string for no label
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/icons/shape.png',
                height: 18,
                width: 18,
              ),
            ),
            label: '', // Empty string for no label
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/icons/bookmark.png',
                height: 18,
                width: 18,
              ),
            ),
            label: '', // Empty string for no label
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}


