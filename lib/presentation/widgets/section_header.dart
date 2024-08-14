import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SectionHeader({super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Merriweather', // Custom Font
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.all(0),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Colors.grey,
                ),
              )),
              padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 10)),
              minimumSize: WidgetStateProperty.all(Size(0, 30)), // Adjust the height as needed
            ),
            onPressed: onPressed,
            child: const Text('See more', style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400
            ),),
          ),

        ],
      ),
    );
  }
}