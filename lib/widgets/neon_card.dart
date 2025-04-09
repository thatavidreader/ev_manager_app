import 'package:flutter/material.dart';

class NeonCard extends StatelessWidget {
  final Widget child;
  const NeonCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2), // Dark semi-transparent background
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF00E676).withOpacity(0.7), // Neon green glow
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: Color(0xFF00E676), width: 1.5),
      ),
      padding: EdgeInsets.all(16.0),
      child: child,
    );
  }
}
