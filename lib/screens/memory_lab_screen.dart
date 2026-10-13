import 'package:flutter/material.dart';
import 'dual_n_back_screen.dart';
import 'gaze_focus_screen.dart';

class MemoryLabScreen extends StatelessWidget {
  const MemoryLabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🧠 مختبر الذاكرة والتركيز الأصيل'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            icon: '🎮',
            title: '1. تدريب Dual N-Back',
            duration: '15-20 دقيقة',
            desc: 'المعيار الذهبي لتوسيع سعة الذاكرة العاملة (WMC) والذكاء السائل بمعالجة إشارات متزامنة.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DualNBackScreen())),
          ),
          _buildCard(
            context,
            icon: '🎯',
            title: '2. تثبيت التحديق البصري',
            duration: '90 ثانية',
            desc: 'تثبيت النظر الإرادي لرفع الأستيل كولين والنورإبينفرين وشحذ الانتباه قبل العمل العميق.',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GazeFocusScreen())),
          ),
          _buildCard(
            context,
            icon: '🔢',
            title: '3. المدى العكسي والحساب المتتابع',
            duration: '8 دقائق',
            desc: 'عكس سلاسل الأرقام 4 إلى 8 ذهنياً، وطرح 100 - 7 متتالياً لمقاومة التداخل العصبي.',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('متاح في الشاشة التفاعلية الرئيسية ونسخة الويب السريعة')),
              );
            },
          ),
          _buildCard(
            context,
            icon: '🌙',
            title: '4. الاسترجاع المسائي العكسي',
            duration: '12-15 دقيقة',
            desc: 'استعراض أحداث اليوم بترتيب زمني معكوس دقيقة بدقيقة مع الدقة الحسية لتنشيط الحصين.',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('جلسة الاسترجاع الليلي جاهزة في جدول الإنجاز اليومي')),
              );
            },
          ),
          _buildCard(
            context,
            icon: '👁️',
            title: '5. تمرين كيم للملاحظة الحسية',
            duration: '8 دقائق',
            desc: 'تأمل مشهد غني لـ 45 ثانية ثم إعادة تدوينه ورسمه من الذاكرة وتدقيق الفجوات المكانية.',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('افتح المشهد الحسي في تطبيق الويب أو الجلسات السريعة')),
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
                color: const Color(0xFFF59E0B).withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(duration, style: const TextStyle(color: Color(0xFFF59E0B), fontSize: 10, fontWeight: FontWeight.bold)),
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
