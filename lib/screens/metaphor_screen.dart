import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class MetaphorScreen extends StatefulWidget {
  const MetaphorScreen({super.key});

  @override
  State<MetaphorScreen> createState() => _MetaphorScreenState();
}

class _MetaphorScreenState extends State<MetaphorScreen> {
  final List<String> _concepts = ['الوقت', 'الغضب', 'الصبر', 'الفكرة', 'الشك', 'العزيمة', 'الصمت', 'الأمل'];
  final List<List<String>> _pairs = [
    ['الحاسوب', 'الشجرة'],
    ['المفتاح', 'الصمت'],
    ['النهر', 'الذاكرة'],
    ['السيف', 'الكلمة'],
  ];

  String _currentConcept = 'الوقت';
  List<String> _currentPair = ['الحاسوب', 'الشجرة'];
  int _secondsLeft = 45;
  bool _isRunning = false;
  Timer? _timer;

  void _pickNewConcept() {
    setState(() => _currentConcept = _concepts[Random().nextInt(_concepts.length)]);
  }

  void _pickNewPair() {
    setState(() => _currentPair = _pairs[Random().nextInt(_pairs.length)]);
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _secondsLeft = 45;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
        setState(() => _isRunning = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('أحسنت! تدريب التفكير البلاغي أنجز +35 XP ⚡'), backgroundColor: Colors.green),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قصف التشبيهات والمجاز السريع'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Section A
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF59E0B).withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'المسار (أ): قصف التشبيهات للمفاهيم المجردة (45 ثانية)',
                  style: TextStyle(color: Color(0xFFF59E0B), fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 6),
                const Text('صغ 3 تشبيهات مبتكرة فوراً للمفهوم المعروض:', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                const SizedBox(height: 14),
                Center(
                  child: Text(
                    _currentConcept,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8)),
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: Text(
                    '00:${_secondsLeft.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'monospace', color: Colors.white),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0284C7),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: _isRunning ? null : _startTimer,
                        child: const Text('بدء الـ 45 ثانية'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _pickNewConcept,
                        child: const Text('مفهوم آخر'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Section B
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF8B5CF6).withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'المسار (ب): جسور التشابه بين الأضداد (30 ثانية)',
                  style: TextStyle(color: Color(0xFFA855F7), fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 6),
                const Text('استخرج بصوت عالٍ 3 نقاط تشابه غير بديهية بين:', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                const SizedBox(height: 14),
                Center(
                  child: Text(
                    '"${_currentPair[0]}" و "${_currentPair[1]}"',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 14),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 44),
                  ),
                  onPressed: _pickNewPair,
                  child: const Text('توليد زوجين متباعدين آخرين'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
