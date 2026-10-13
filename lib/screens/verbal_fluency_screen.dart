import 'package:flutter/material.dart';
import 'speech_stream_screen.dart';
import 'metaphor_screen.dart';

class VerbalFluencyScreen extends StatelessWidget {
  const VerbalFluencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🗣️ مختبر الطلاقة اللفظية والبديهة'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            icon: '🎙️',
            title: '1. الارتجال الصوتي المتدفق',
            duration: '5 دقائق',
            desc: 'تحدث متواصل لـ 60 ثانية عن غرض عشوائي دون توقف ودون استخدام كلمات حشو (يعني/إممم).',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SpeechStreamScreen())),
          ),
          _buildCard(
            context,
            icon: '✨',
            title: '2. قصف التشبيهات والمجاز السريع',
            duration: '5 دقائق',
            desc: 'صياغة 3 تشبيهات مبتكرة في 45 ثانية، وبناء جسور التشابه بين الأضداد لسرعة البديهة.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MetaphorScreen())),
          ),
          _buildCard(
            context,
            icon: '⚡',
            title: '3. سباقات الطلاقة الصوتية والدلالية',
            duration: '5 دقائق',
            desc: 'استدعاء أكبر عدد من الكلمات بحرف محدد في 60 ثانية لكسر بطء النفاذ المعجمي.',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('سباق الطلاقة متاح أيضاً في الشاشة التفاعلية الرئيسية')),
              );
            },
          ),
          _buildCard(
            context,
            icon: '🔄',
            title: '4. التبديل الفئوي المقاوم للتجمد',
            duration: '3 دقائق',
            desc: 'ذكر كلمة من فئة (أ) ثم كلمة من فئة (ب) بالتناوب الإلزامي لتدريب المرونة الإدراكية.',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تحدي التبديل الفئوي متاح في جلسات الروتين النهاري')),
              );
            },
          ),
          _buildCard(
            context,
            icon: '🗝️',
            title: '5. فك احتباس الكلمات والوصف الالتفافي',
            duration: '4 دقائق',
            desc: 'شرح غرض دقيق دون ذكر اسمه في 20 ثانية لبرمجة مسار بديل لظاهرة "على طرف اللسان".',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('الوصف الالتفافي متاح في جلسات الروتين النهاري')),
              );
            },
          ),
          _buildCard(
            context,
            icon: '💬',
            title: '6. مراجعة الحوارات وترقية الصياغات',
            duration: '5 دقائق',
            desc: 'إعادة صياغة نقاشات اليوم ذهنياً واستبدال العبارات بتشبيهات وألفاظ أبلغ ليوم غد.',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('جلسة ترقية الحوارات مفعلة في روتين المساء')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String icon,
    required String title,
    required String duration,
    required String desc,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(icon, style: const TextStyle(fontSize: 22)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8).withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(duration, style: const TextStyle(color: Color(0xFF38BDF8), fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(desc, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8), height: 1.4)),
        ),
        onTap: onTap,
      ),
    );
  }
}
