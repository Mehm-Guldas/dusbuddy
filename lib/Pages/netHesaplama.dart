import 'package:flutter/material.dart';
import '../Database/sqfliteNet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Net Hesaplama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NetHesaplama(),
    );
  }
}

class NetHesaplama extends StatefulWidget {
  @override
  _NetHesaplamaState createState() => _NetHesaplamaState();
}

class _NetHesaplamaState extends State<NetHesaplama> {
  final TextEditingController temelDogruController = TextEditingController();
  final TextEditingController temelYanlisController = TextEditingController();
  final TextEditingController klinikDogruController = TextEditingController();
  final TextEditingController klinikYanlisController = TextEditingController();

  double temelNet = 0;
  double klinikNet = 0;
  List<Map<String, dynamic>> sonuclarim = [];

  void hesaplaNet() {
    setState(() {
      int temelDogru = int.tryParse(temelDogruController.text) ?? 0;
      int temelYanlis = int.tryParse(temelYanlisController.text) ?? 0;
      int klinikDogru = int.tryParse(klinikDogruController.text) ?? 0;
      int klinikYanlis = int.tryParse(klinikYanlisController.text) ?? 0;

      temelNet = temelDogru - (temelYanlis / 4);
      klinikNet = klinikDogru - (klinikYanlis / 4);
    });
  }

  Future<void> kaydetSonuc() async {
    String tarih = DateTime.now().toString();
    await DatabaseHelper().insertSonuc(tarih, temelNet, klinikNet);
    await loadSonuclar();
  }

  Future<void> loadSonuclar() async {
    final sonucList = await DatabaseHelper().getSonuclar();
    print('Veritabanından gelen sonuçlar: $sonucList'); // Verilerin geldiğini kontrol et
    setState(() {
      sonuclarim = sonucList;
    });
  }


  Future<void> silSonuc(int id) async {
    await DatabaseHelper().deleteSonuc(id);
    await loadSonuclar();
  }

  @override
  void initState() {
    super.initState();
    loadSonuclar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Net Hesaplama'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Net Hesaplama',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 120),
                Text('Doğru', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Yanlış', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Temel Bilimler'),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: temelDogruController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: temelYanlisController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Klinik Bilimler'),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: klinikDogruController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: klinikYanlisController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: hesaplaNet,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Hesapla'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sonuçlar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Temel Bilimler Testi: ${temelNet.toStringAsFixed(2)} net'),
            Text('Klinik Bilimler Testi: ${klinikNet.toStringAsFixed(2)} net'),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: kaydetSonuc,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Kaydet'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sonuçlarım',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: sonuclarim.isNotEmpty
                  ? ListView.builder(
                itemCount: sonuclarim.length,
                itemBuilder: (context, index) {
                  final sonuc = sonuclarim[index];
                  return ListTile(
                    title: Text(
                        'Tarih: ${sonuc['tarih']}, TBT: ${sonuc['temel_net']}, KBT: ${sonuc['klinik_net']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => silSonuc(sonuc['id']),
                    ),
                  );
                },
              )
                  : Center(child: Text('Kayıtlı sonuç bulunmamaktadır.')),
            ),

          ],
        ),
      ),
    );
  }
}
