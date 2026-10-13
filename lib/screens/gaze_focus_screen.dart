import 'dart:async';
import 'package:flutter/material.dart';

class GazeFocusScreen extends StatefulWidget {
  const GazeFocusScreen({super.key});

  @override
  State<GazeFocusScreen> createState() => _GazeFocusScreenState();
}

class _GazeFocusScreenState extends State<GazeFocusScreen> {
  int _secondsLeft = 90;
  bool _isRunning = false;
  Timer? _timer;

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _secondsLeft = 90;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
        setState(() => _isRunning = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم تثبيت البصر وشحذ الانتباه! +30 XP ⚡'), backgroundColor: Colors.green),
        );
      }
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _secondsLeft = 90;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: const Text('تثبيت التحديق البصري (90 ثانية)'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'ثبت نظرك بالكامل على النقطة البيضاء وتنفس بهدوء دون أن ترمش قدر الإمكان.',
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Black Focus Canvas
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white70,
                          blurRadius: 16,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '$minutes:$seconds',
              style: const TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
                color: Color(0xFF38BDF8),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF59E0B),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _isRunning ? null : _startTimer,
                    child: Text(_isRunning ? 'الجلسة جارية...' : 'بدء الـ 90 ثانية', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _resetTimer,
                    child: const Text('إعادة ضبط'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
