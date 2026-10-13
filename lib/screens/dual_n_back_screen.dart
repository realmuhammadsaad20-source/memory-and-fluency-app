import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class DualNBackScreen extends StatefulWidget {
  const DualNBackScreen({super.key});

  @override
  State<DualNBackScreen> createState() => _DualNBackScreenState();
}

class _DualNBackScreenState extends State<DualNBackScreen> {
  int _nLevel = 1;
  int _currentRound = 0;
  final int _maxRounds = 20;
  int _score = 0;
  bool _isPlaying = false;

  int _activePosition = -1;
  String _activeLetter = '';

  final List<int> _positionHistory = [];
  final List<String> _audioHistory = [];
  final List<String> _lettersPool = ['أ', 'ب', 'ت', 'س', 'م', 'ن', 'ل', 'ر'];

  Timer? _gameTimer;

  void _startSession() {
    setState(() {
      _isPlaying = true;
      _currentRound = 0;
      _score = 0;
      _positionHistory.clear();
      _audioHistory.clear();
    });
    _runNextTurn();
  }

  void _runNextTurn() {
    if (_currentRound >= _maxRounds) {
      _finishSession();
      return;
    }

    setState(() {
      _currentRound++;
      final pos = Random().nextInt(9);
      final letter = _lettersPool[Random().nextInt(_lettersPool.length)];

      _activePosition = pos;
      _activeLetter = letter;
      _positionHistory.add(pos);
      _audioHistory.add(letter);
    });

    // Clear after 1.2s
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted && _isPlaying) {
        setState(() {
          _activePosition = -1;
          _activeLetter = '...';
        });
      }
    });

    // Next round after 3s
    _gameTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && _isPlaying) {
        _runNextTurn();
      }
    });
  }

  void _checkMatch(bool isPosition) {
    if (_currentRound <= _nLevel) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('انتظر حتى تتجاوز البداية للمقارنة!'), duration: Duration(seconds: 1)),
      );
      return;
    }

    final targetIdx = _currentRound - 1 - _nLevel;
    final currentIdx = _currentRound - 1;

    if (isPosition) {
      if (_positionHistory[currentIdx] == _positionHistory[targetIdx]) {
        setState(() => _score += 10);
        _showToast('صحيح! تطابق الموضع 🎯 (+10)', Colors.green);
      } else {
        setState(() => _score = max(0, _score - 5));
        _showToast('خطأ! لم يتطابق الموضع (-5)', Colors.red);
      }
    } else {
      if (_audioHistory[currentIdx] == _audioHistory[targetIdx]) {
        setState(() => _score += 10);
        _showToast('صحيح! تطابق الصوت 🔊 (+10)', Colors.green);
      } else {
        setState(() => _score = max(0, _score - 5));
        _showToast('خطأ! لم يتطابق الصوت (-5)', Colors.red);
      }
    }
  }

  void _showToast(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: color, duration: const Duration(milliseconds: 800)),
    );
  }

  void _finishSession() {
    setState(() {
      _isPlaying = false;
      _activePosition = -1;
      _activeLetter = 'اكتملت الجلسة!';
    });
    _showToast('أحسنت! نتيجتك النهائية: $_score نقطة ⚡', Colors.blue);
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تدريب Dual N-Back التفاعلي'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('المستوى: $_nLevel-Back', style: const TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold)),
                Text('الجولة: $_currentRound / $_maxRounds', style: const TextStyle(color: Colors.white70)),
                Text('النقاط: $_score', style: const TextStyle(color: Color(0xFFF59E0B), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              _isPlaying ? 'حرف: $_activeLetter' : 'اضغط "بدء الجلسة"',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFF59E0B)),
            ),
          ),
          const SizedBox(height: 20),
          // 3x3 Grid
          Center(
            child: SizedBox(
              width: 270,
              height: 270,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final isActive = _activePosition == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFF38BDF8) : const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isActive ? Colors.white : Colors.white12,
                        width: isActive ? 2 : 1,
                      ),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: const Color(0xFF38BDF8).withOpacity(0.6),
                                blurRadius: 16,
                                spreadRadius: 2,
                              )
                            ]
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Controls
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    foregroundColor: const Color(0xFFBFDBFE),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isPlaying ? () => _checkMatch(true) : null,
                  child: const Column(
                    children: [
                      Text('📍 تطابق الموضع', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('اضغط إذا تطابق المكان', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF78350F),
                    foregroundColor: const Color(0xFFFDE68A),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isPlaying ? () => _checkMatch(false) : null,
                  child: const Column(
                    children: [
                      Text('🔊 تطابق الصوت', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('اضغط إذا تطابق الحرف', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0284C7),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isPlaying ? null : _startSession,
                  child: Text(_isPlaying ? 'الجلسة جارية...' : '▶️ بدء جلسة الـ Dual N-Back', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isPlaying
                      ? null
                      : () {
                          setState(() {
                            _nLevel = _nLevel == 1 ? 2 : (_nLevel == 2 ? 3 : 1);
                          });
                        },
                  child: const Text('تغيير المستوى'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
