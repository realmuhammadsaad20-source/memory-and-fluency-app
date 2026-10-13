import 'package:flutter/material.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🗺️ خطة الـ 60 يوماً والجدول اليومي'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Schedule Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('⏰ التوزيع الزمني البيولوجي الأمثل', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF38BDF8))),
                SizedBox(height: 12),
                Text('• الصباح (7:00 – 8:30 ص): تثبيت النظر + Dual N-Back + إحماء صوتي (25–30 د)', style: TextStyle(fontSize: 12, height: 1.5)),
                SizedBox(height: 6),
                Text('• منتصف اليوم (11:30 ص – 1:00 م): الارتجال المتدفق + قصف التشبيهات + تبديل فئوي (15 د)', style: TextStyle(fontSize: 12, height: 1.5)),
                SizedBox(height: 6),
                Text('• العصر (4:30 – 5:30 م): رياضة هوائية Zone 2 (BDNF) + تمرين كيم الحسي (30 د)', style: TextStyle(fontSize: 12, height: 1.5)),
                SizedBox(height: 6),
                Text('• قبل النوم (9:30 – 10:30 م): الاسترجاع المسائي وترقية صياغة الحوارات (15 د)', style: TextStyle(fontSize: 12, height: 1.5)),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Phase 1
          _buildPhaseCard(
            title: 'المرحلة 1: التأسيس الانتباهي وكسر التجمد',
            weeks: 'الأسابيع 1 و 2',
            color: const Color(0xFF38BDF8),
            desc: 'كبح التشتت، القضاء على أصوات الحشو ("يعني/إممم")، وعكس 5 أرقام بثبات.\nالتمارين: تثبيت البصر + سباقات الطلاقة + ارتجال متدفق + استرجاع مسائي.',
          ),

          const SizedBox(height: 12),

          // Phase 2
          _buildPhaseCard(
            title: 'المرحلة 2: توسيع الذاكرة وبناء التشبيهات',
            weeks: 'الأسابيع 3 إلى 5',
            color: const Color(0xFFF59E0B),
            desc: 'إدخال Dual N-Back الصارم، وقصف التشبيهات السريعة، والتبديل الفئوي ومراجعة الحوارات.\nالهدف: استقرار 2-Back بدقة 80%، صياغة 3 تشبيهات في 45 ثانية، وتجاوز 22 كلمة/د.',
          ),

          const SizedBox(height: 12),

          // Phase 3
          _buildPhaseCard(
            title: 'المرحلة 3: التحمل الإدراكي والارتجال البلاغي',
            weeks: 'الأسابيع 6 إلى 8',
            color: const Color(0xFF10B981),
            desc: 'الوصول إلى أقصى طاقة استرجاعية (3-Back و 4-Back) وتدفق لغوي عفوي سريع البديهة في أي موقف.\nالنتيجة: حضور ذهني حاد، انعدام تأخر الكلمات، وذاكرة تستحضر المعطيات تلقائياً.',
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseCard({
    required String title,
    required String weeks,
    required Color color,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(weeks, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8), height: 1.5)),
        ],
      ),
    );
  }
}
