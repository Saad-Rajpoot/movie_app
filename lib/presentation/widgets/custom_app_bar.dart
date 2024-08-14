import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon:  Image.asset(
          'assets/icons/menu.png',
          color: Colors.black,
          width: 24.0,
          height: 24.0,
        ),
        onPressed: () {},
      ),
      title: const Text('FilmKu',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontFamily: 'Merriweather',
              fontSize: 16)),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/icons/notification.png',
            color: Colors.black,
            width: 24.0,
            height: 24.0,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
