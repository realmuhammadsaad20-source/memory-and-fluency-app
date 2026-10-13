import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class SpeechStreamScreen extends StatefulWidget {
  const SpeechStreamScreen({super.key});

  @override
  State<SpeechStreamScreen> createState() => _SpeechStreamScreenState();
}

class _SpeechStreamScreenState extends State<SpeechStreamScreen> {
  final List<String> _topics = [
    'القلم وأثره في تخليد أفكار الإنسانية عبر العصور',
    'الساعة ومفهوم انسياب اللحظة الحاضرة والزمن',
    'المرآة وما تخفيه الوجوه خلف الملامح الظاهرة',
    'الشجرة كرمز للصبر وتجذر المبادئ رغم العواصف',
    'البحر وجسارة الإبحار في المجهول والتحدي',
    'النافذة والفرق بين الناظر العابر والمتأمل العميق',
    'المفتاح وفكرة فتح الأبواب المغلقة في الحياة',
    'الغيمة وعطاء المطر غير المشروط للأرض العطشى',
    'الجسور وبناء العلاقات المتينة بين المتباعدين',
    'النار بين الدفء والتدمير والتحول والنشاط',
  ];

  String _currentTopic = '';
  int _secondsLeft = 60;
  bool _isRunning = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pickNewTopic();
  }

  void _pickNewTopic() {
    setState(() {
      _currentTopic = _topics[Random().nextInt(_topics.length)];
    });
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _secondsLeft = 60;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
        setState(() => _isRunning = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('اكتمل تدريب التدفق اللفظي! +40 XP ⚡'), backgroundColor: Colors.green),
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
        title: const Text('الارتجال الصوتي المتدفق (60 ثانية)'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'تحدث بصوت عالٍ ومسموع لـ 60 ثانية متواصلة دون توقف ودون كلمات حشو (يعني/إممم).',
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF131B2E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF38BDF8).withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  const Text('موضوع الارتجال الحالي:', style: TextStyle(color: Color(0xFFF59E0B), fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                    _currentTopic,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              '00:${_secondsLeft.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
                color: Color(0xFF38BDF8),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD97706),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _isRunning ? null : _startTimer,
                    child: Text(_isRunning ? 'الجلسة جارية...' : '▶️ ابدأ الـ 60 ثانية', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _pickNewTopic,
                    child: const Text('موضوع آخر'),
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
