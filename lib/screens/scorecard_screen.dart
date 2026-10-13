import 'package:flutter/material.dart';

class ScorecardScreen extends StatefulWidget {
  const ScorecardScreen({super.key});

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen> {
  final _nbackController = TextEditingController();
  final _backwardController = TextEditingController();
  final _fluencyController = TextEditingController();
  final _metaphorController = TextEditingController();

  final List<Map<String, String>> _scores = [
    {'day': 'السبت', 'nback': '2-Back (80%)', 'backward': '5 أرقام', 'fluency': 'حرف م (20)', 'metaphor': 'سريع'},
    {'day': 'الأحد', 'nback': '2-Back (85%)', 'backward': '6 أرقام', 'fluency': 'حرف ر (22)', 'metaphor': 'سريع'},
    {'day': 'الإثنين', 'nback': '2-Back (85%)', 'backward': '6 أرقام', 'fluency': 'حرف س (24)', 'metaphor': 'ممتاز'},
  ];

  void _saveScore() {
    if (_nbackController.text.isEmpty && _backwardController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى كتابة قياس واحد على الأقل')),
      );
      return;
    }

    setState(() {
      _scores.add({
        'day': 'اليوم',
        'nback': _nbackController.text.isNotEmpty ? _nbackController.text : '2-Back (85%)',
        'backward': _backwardController.text.isNotEmpty ? _backwardController.text : '6 أرقام',
        'fluency': _fluencyController.text.isNotEmpty ? _fluencyController.text : '22 كلمة',
        'metaphor': _metaphorController.text.isNotEmpty ? _metaphorController.text : 'ممتاز',
      });
      _nbackController.clear();
      _backwardController.clear();
      _fluencyController.clear();
      _metaphorController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم حفظ القياسات بنجاح وحصد +30 XP! 📊'), backgroundColor: Colors.green),
    );
  }

  @override
  void dispose() {
    _nbackController.dispose();
    _backwardController.dispose();
    _fluencyController.dispose();
    _metaphorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📊 سجل القياسات والتدقيق الأسبوعي'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Input Form
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('📝 تسجيل قياسات اليوم', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF38BDF8))),
                const SizedBox(height: 12),
                TextField(
                  controller: _nbackController,
                  decoration: const InputDecoration(
                    labelText: 'مستوى Dual N-Back',
                    hintText: 'مثال: 2-Back (85%)',
                    filled: true,
                    fillColor: Colors.black26,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _backwardController,
                  decoration: const InputDecoration(
                    labelText: 'المدى العكسي للأرقام',
                    hintText: 'مثال: سلسلة من 6 أرقام',
                    filled: true,
                    fillColor: Colors.black26,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _fluencyController,
                  decoration: const InputDecoration(
                    labelText: 'الطلاقة الصوتية (كلمة/دقيقة)',
                    hintText: 'مثال: حرف م (22 كلمة)',
                    filled: true,
                    fillColor: Colors.black26,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _metaphorController,
                  decoration: const InputDecoration(
                    labelText: 'سرعة التشبيهات والمجاز',
                    hintText: 'مثال: سريع ومبتكر',
                    filled: true,
                    fillColor: Colors.black26,
                  ),
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF059669),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: _saveScore,
                  child: const Text('💾 حفظ القياسات اليومية', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Scorecard Table
          const Text('📅 سجل الأسبوع الحالي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(const Color(0xFF131B2E)),
              dataRowColor: MaterialStateProperty.all(Colors.black26),
              columns: const [
                DataColumn(label: Text('اليوم', style: TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Dual N-Back', style: TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold))),
                DataColumn(label: Text('المدى العكسي', style: TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold))),
                DataColumn(label: Text('الطلاقة اللفظية', style: TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold))),
                DataColumn(label: Text('سرعة التشبيهات', style: TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold))),
              ],
              rows: _scores.map((s) {
                return DataRow(cells: [
                  DataCell(Text(s['day']!, style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(Text(s['nback']!)),
                  DataCell(Text(s['backward']!)),
                  DataCell(Text(s['fluency']!)),
                  DataCell(Text(s['metaphor']!)),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
