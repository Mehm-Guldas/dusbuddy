import 'dart:async';
import 'package:dusbuddy2/Database/sqflite_kronometre.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tarih formatlama için
import 'dart:math'; // Daire çizerken radianlar kullanacağız

class ChronometerScreen extends StatefulWidget {
  const ChronometerScreen({Key? key}) : super(key: key);

  @override
  State<ChronometerScreen> createState() => _ChronometerScreenState();
}

class _ChronometerScreenState extends State<ChronometerScreen> {
  late ChronometerDatabase db;
  Stopwatch _stopwatch = Stopwatch();
  Duration _duration = Duration();
  late String _formattedTime;
  TextEditingController _nameController = TextEditingController();
  List<Map<String, dynamic>> _chronometerList = [];
  Timer? _timer; // Zamanlayıcı nullable olabilir
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    db = ChronometerDatabase();
    db.openDb().then((_) {
      _loadChronometers();
    });
    _formattedTime = _formatTime(_duration);
  }

  Future<void> _loadChronometers() async {
    try {
      List<Map<String, dynamic>> chronometers = await db.getChronometers();
      setState(() {
        _chronometerList = chronometers;
      });
    } catch (e) {
      print("Veritabanı hatası: $e");
    }
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _duration = _stopwatch.elapsed;
          _formattedTime = _formatTime(_duration);
          _progress = (_duration.inSeconds % 60) / 60.0;
        });
      });
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
      _timer?.cancel(); // Zamanlayıcı null kontrolü
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _duration = Duration();
      _formattedTime = _formatTime(_duration);
      _nameController.clear();
      _progress = 0.0;
    });
  }

  Future<void> _saveChronometer() async {
    try {
      String name = _nameController.text;
      String date = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

      await db.insertChronometer(name, _duration.inSeconds, date);
      await _loadChronometers();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kronometre kaydedildi!")),
      );
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Timer'ı temizle ve null kontrolü
    _stopwatch.stop(); // Stopwatch'ı durdur
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kronometre')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Süre:',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            CustomPaint(
              painter: CircularBorderPainter(_progress),
              child: Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                child: Text(
                  '$_formattedTime',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Kronometre Adı',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: _startStopwatch,
                  icon: Icon(Icons.play_arrow),
                  label: Text('Başlat'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green, // primary yerine foregroundColor kullanılıyor
                    side: BorderSide(color: Colors.green),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
                SizedBox(width: 20),
                OutlinedButton.icon(
                  onPressed: _stopStopwatch,
                  icon: Icon(Icons.pause),
                  label: Text('Durdur'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange, // primary yerine foregroundColor
                    side: BorderSide(color: Colors.orange),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
                SizedBox(width: 20),
                OutlinedButton.icon(
                  onPressed: _resetStopwatch,
                  icon: Icon(Icons.refresh),
                  label: Text('Sıfırla'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red, // primary yerine foregroundColor
                    side: BorderSide(color: Colors.red),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: _saveChronometer,
              icon: Icon(Icons.save),
              label: Text('Kaydet'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue, // primary yerine foregroundColor
                side: BorderSide(color: Colors.blue),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _chronometerList.isEmpty
                  ? Center(child: Text('Kayıtlı veri bulunmuyor'))
                  : ListView.builder(
                itemCount: _chronometerList.length,
                itemBuilder: (context, index) {
                  final chronometer = _chronometerList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(chronometer['name']),
                      subtitle: Text(
                        'Süre: ${_formatTime(Duration(seconds: chronometer['duration']))} - ${chronometer['date']}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularBorderPainter extends CustomPainter {
  final double progress;

  CircularBorderPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint basePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..color = Color.fromARGB(255, 0, 255, 51)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;
    final double sweepAngle = 2 * pi * progress;
    final Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, basePaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
