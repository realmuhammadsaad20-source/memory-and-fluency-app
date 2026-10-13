import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 الموسوعة والمرجع العلمي من الكتاب'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAccordion(
            title: 'الفصل 1: الأساس العصبي للذاكرة وتراجع الطلاقة',
            content: '• فخ الحيل المصطنعة: الحيل كقصر الذاكرة تفرض حملاً إدراكياً وسيطاً ولا تنقل الأثر للمحادثات أو حل المشكلات المعقدة.\n\n• بيولوجيا النفاذ المعجمي: الكلمات مخزنة في الفص الصدغي، وتتباطأ مع السنوات بسبب ضعف التنشيط المشبكي في القشرة الجبهية السفلية اليسرى (LIFG) وبروكا، وضعف التثبيط مما يسبب ظاهرة "على طرف اللسان". التدريب العصبي المركز يعيد بناء غمد الميالين وسرعة النفاذ.',
          ),
          _buildAccordion(
            title: 'الفصل 2: الركائز العصبية الأربع',
            content: '1. سعة الذاكرة العاملة (WMC): في القشرة أمام الجبهية الظهرانية الجانبية (dlPFC)، لمعالجة المعلومات وبناء حجج طويلة دون فقدان خيط الفكرة.\n\n2. كبح التشتت وتصفية الضوضاء: في الباحة الحزامية الأمامية (ACC)، لمنع تشتت الانتباه الداخلي وتصفية الكلمات المنافسة.\n\n3. النفاذ المعجمي السريع: استدعاء المفردة الدقيقة دون بطء أو تردد.\n\n4. التفكير المجازي والدمج المفاهيمي: في الوصلة الصدغية الجدارية وربط الأفكار البعيدة لصياغة التشبيهات البلاغية.',
          ),
          _buildAccordion(
            title: 'الفصل 7: البيولوجيا العصبية الداعمة',
            content: '• بروتين BDNF: الرياضة الهوائية Zone 2 لـ 25-30 دقيقة تطلق عامل التغذية العصبية المحفز لبناء خلايا ذاكرة جديدة في التلفيف المسنن للحصين.\n\n• الأستيل كولين: تناول مصادر الكولين (كالبيض والأسماك) وأوميغا-3 (DHA) للحفاظ على سيولة المشابك لسرعة انتقال الإشارات اللفظية.\n\n• نوم الموجات البطيئة (SWS): التثبيت الحقيقي للذاكرة والمسارات اللغوية يحدث أثناء النوم العميق عبر موجات Sharp-Wave Ripples.\n\n• الصيام المعرفي الرقمي: حماية الدوبامين من الفيديوهات القصيرة السريعة التي تضعف قدرة الفص الجبهي على التوليد اللفظي الذاتي.',
          ),
        ],
      ),
    );
  }

  Widget _buildAccordion({required String title, required String content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF38BDF8))),
        childrenPadding: const EdgeInsets.all(16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(content, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8), height: 1.6)),
        ],
      ),
    );
  }
}
