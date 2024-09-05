import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

void main() {
  runApp(const ScribbleApp());
}

class ScribbleApp extends StatelessWidget {
  const ScribbleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ScribbleScreen(),
      ),
    );
  }
}

class ScribbleScreen extends StatelessWidget {
  const ScribbleScreen({super.key});

  // Function to trigger haptic feedback on interaction
  void _triggerHapticFeedback() async {
    await Haptics.vibrate(HapticsType.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          _triggerHapticFeedback(); // Trigger feedback when scribbling
        },
        child: Container(
          color: Colors.black, // Blank black screen
          child: const Center(
            child: Text(
              'Scribble Here!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
