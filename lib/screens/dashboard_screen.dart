import 'package:flutter/material.dart';
import 'dual_n_back_screen.dart';
import 'gaze_focus_screen.dart';
import 'speech_stream_screen.dart';
import 'metaphor_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _xp = 120;
  int _streak = 1;

  final Map<String, bool> _completedTasks = {};

  final List<Map<String, dynamic>> _routineTasks = [
    {
      'id': 'gaze',
      'period': 'الصباح الباكر (7:00 ص)',
      'title': 'تثبيت التحديق البصري (90 ثانية)',
      'xp': 20,
    },
    {
      'id': 'nback',
      'period': 'الصباح (7:30 ص)',
      'title': 'تدريب Dual N-Back (20 جولة)',
      'xp': 50,
    },
    {
      'id': 'backward',
      'period': 'الصباح (8:00 ص)',
      'title': 'المدى العكسي وإحماء الطلاقة الصوتية',
      'xp': 30,
    },
    {
      'id': 'stream',
      'period': 'قبل الظهر (11:30 ص)',
      'title': 'الارتجال الصوتي المتدفق (3 جولات)',
      'xp': 40,
    },
    {
      'id': 'metaphor',
      'period': 'منتصف اليوم (12:00 م)',
      'title': 'قصف التشبيهات والمجاز السريع',
      'xp': 40,
    },
    {
      'id': 'switching',
      'period': 'الظهيرة (12:30 م)',
      'title': 'التبديل الفئوي والوصف الالتفافي',
      'xp': 30,
    },
    {
      'id': 'cardio',
      'period': 'العصر (5:00 م)',
      'title': 'رياضة هوائية (BDNF) وفحص كيم الحسي',
      'xp': 40,
    },
    {
      'id': 'night',
      'period': 'قبل النوم (10:00 م)',
      'title': 'الاسترجاع المسائي وترقية الحوارات',
      'xp': 50,
    },
  ];

  String _getCurrentPeriodRecommendation() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 10) {
      return 'الفترة الصباحية: تثبيت البصر والذاكرة العاملة';
    } else if (hour >= 10 && hour < 14) {
      return 'منتصف اليوم: قصف التشبيهات والارتجال اللفظي';
    } else if (hour >= 14 && hour < 18) {
      return 'العصر: تمرين كيم للملاحظة الحسية والهوائيات';
    } else {
      return 'المساء: الاسترجاع العكسي ومراجعة الحوارات';
    }
  }

  @override
  Widget build(BuildContext context) {
    final level = (_xp / 200).floor() + 1;
    final currentLevelXp = _xp % 200;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF131B2E).withOpacity(0.9),
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8).withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('🧠', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الذاكرة والطلاقة الأصيلة',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  'البروتوكول العصبي المعرفي اليومي',
                  style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8)),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFF59E0B).withOpacity(0.3)),
            ),
            child: Text(
              '🔥 $_streak يوم',
              style: const TextStyle(
                color: Color(0xFFF59E0B),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF38BDF8).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF38BDF8).withOpacity(0.3)),
            ),
            child: Text(
              '⚡ $_xp XP',
              style: const TextStyle(
                color: Color(0xFF38BDF8),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Hero Banner
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E1B4B), Color(0xFF0F172A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'صباح التوقد الذهني ☀️',
                  style: TextStyle(
                    color: Color(0xFFF59E0B),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'طوّر عتاد دماغك البيولوجي اليوم',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'بدون حيل أو قصور ذهنية؛ تدريب نقي للذاكرة العاملة والطلاقة اللفظية وسرعة البديهة.',
                  style: TextStyle(fontSize: 12, color: Color(0xFFCBD5E1)),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'الفترة الموصى بها الآن',
                              style: TextStyle(fontSize: 10, color: Color(0xFF38BDF8)),
                            ),
                            Text(
                              _getCurrentPeriodRecommendation(),
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF59E0B),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const DualNBackScreen()),
                          );
                        },
                        child: const Text('ابدأ الآن ⚡', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Quick Exercise Launch Grid
          const Text(
            '🚀 جلسات التدريب السريعة',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildQuickButton(
                  title: 'Dual N-Back',
                  icon: '🎮',
                  color: const Color(0xFF0284C7),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DualNBackScreen())),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildQuickButton(
                  title: 'تثبيت البصر (90ث)',
                  icon: '🎯',
                  color: const Color(0xFF1E293B),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GazeFocusScreen())),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildQuickButton(
                  title: 'الارتجال المتدفق (60ث)',
                  icon: '🎙️',
                  color: const Color(0xFFD97706),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SpeechStreamScreen())),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildQuickButton(
                  title: 'قصف التشبيهات (45ث)',
                  icon: '✨',
                  color: const Color(0xFF7C3AED),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MetaphorScreen())),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Daily Routine Checklist
          const Text(
            '📋 جدول الإنجاز الميداني لليوم',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ..._routineTasks.map((task) {
            final isDone = _completedTasks[task['id']] ?? false;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: isDone ? const Color(0xFF10B981).withOpacity(0.08) : const Color(0xFF131B2E),
                border: Border.all(
                  color: isDone ? const Color(0xFF10B981).withOpacity(0.3) : Colors.white10,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                dense: true,
                leading: Checkbox(
                  value: isDone,
                  activeColor: const Color(0xFF10B981),
                  onChanged: (val) {
                    setState(() {
                      _completedTasks[task['id']] = val ?? false;
                      if (val == true) {
                        _xp += (task['xp'] as int);
                      } else {
                        _xp = (_xp - (task['xp'] as int)).clamp(0, 99999);
                      }
                    });
                  },
                ),
                title: Text(
                  task['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(
                  '${task['period']} • +${task['xp']} XP',
                  style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                ),
              ),
            );
          }),

          const SizedBox(height: 16),

          // Level Progression Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المستوى $level: ${_getLevelName(level)}',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF38BDF8), fontSize: 14),
                    ),
                    Text('$currentLevelXp / 200 XP', style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: currentLevelXp / 200,
                    backgroundColor: Colors.white10,
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF38BDF8)),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickButton({
    required String title,
    required String icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  String _getLevelName(int lvl) {
    const names = [
      'مبتدئ التركيز',
      'موسع الذاكرة العاملة',
      'سريع البديهة',
      'فصيح النطق',
      'سيد البلاغة والمجاز',
      'عبقري التدفق الإدراكي'
    ];
    return (lvl - 1 < names.length) ? names[lvl - 1] : 'خبير العتاد الإدراكي';
  }
}
