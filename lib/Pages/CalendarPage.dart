import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dusbuddy2/Database/sqflite_kronometre.dart'; // Veritabanı sınıfınızı dahil edin

class CalendarPage extends StatefulWidget {
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();  // Seçilen günü saklar
  List<Map<String, dynamic>> _chronometers = [];  // Seçilen günün verileri
  ChronometerDatabase _db = ChronometerDatabase();  // Veritabanı örneği

  @override
  void initState() {
    super.initState();
    _db.openDb().then((_) {
      _loadChronometersForSelectedDay();  // İlk gün için verileri yükle
    });
  }

  void _loadChronometersForSelectedDay() async {
    // Seçilen günün tarihini Yıl-Ay-Gün formatında oluşturuyoruz
    String formattedDate = "${_selectedDay.year}-${_selectedDay.month.toString().padLeft(2, '0')}-${_selectedDay.day.toString().padLeft(2, '0')}";

    // Tüm verileri veritabanından çekiyoruz
    List<Map<String, dynamic>> data = await _db.getChronometers();

    // Çekilen veriler arasında sadece seçilen günle eşleşen verileri filtreliyoruz
    setState(() {
      _chronometers = data.where((item) => item['date'].startsWith(formattedDate)).toList().reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takvim ve Veriler'),
      ),
      body: Column(
        children: [
          // Takvim widget'ı
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
              _loadChronometersForSelectedDay();  // Seçilen günün verilerini yükle
            },
            calendarFormat: CalendarFormat.month,  // CalendarFormat enumunu kullandığınızdan emin olun
            onFormatChanged: (format) {
              setState(() {
                // Yeni format ayarlarını uygulayın
              });
            },
          ),
          SizedBox(height: 20),
          // Seçilen güne ait verilerin listelenmesi
          Expanded(
            child: _chronometers.isNotEmpty
                ? ListView.builder(
              itemCount: _chronometers.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 3,  // Kart gölgesi ekledik
                  child: ListTile(
                    title: Text(_chronometers[index]['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Süre: ${_chronometers[index]['duration']} saniye\nTarih: ${_chronometers[index]['date']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await _db.deleteChronometer(_chronometers[index]['id']);
                        _loadChronometersForSelectedDay();  // Silindikten sonra güncellenen verileri yükle
                      },
                    ),
                  ),
                );
              },
            )
                : Center(
              child: Text("Bu tarihte kayıtlı veri yok.", style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            ),
          ),
        ],
      ),
    );
  }
}
