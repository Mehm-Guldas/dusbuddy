import 'package:flutter/material.dart';
import '../Database/sqfliteNet.dart';

class SavedResultsPage extends StatefulWidget {
  const SavedResultsPage({super.key});

  @override
  _SavedResultsPageState createState() => _SavedResultsPageState();
}

class _SavedResultsPageState extends State<SavedResultsPage> {
  List<Map<String, dynamic>> sonuclarim = [];

  @override
  void initState() {
    super.initState();
    loadSonuclar();
  }

  Future<void> loadSonuclar() async {
    final sonucList = await DatabaseHelper().getSonuclar();
    setState(() {
      sonuclarim = sonucList;
    });
  }

  Future<void> silSonuc(int id) async {
    await DatabaseHelper().deleteSonuc(id);
    await loadSonuclar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sonuclarim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: sonuclarim.isNotEmpty
            ? ListView.builder(
          itemCount: sonuclarim.length,
          itemBuilder: (context, index) {
            final sonuc = sonuclarim[index];
            return ListTile(
              title: Text(
                  'Tarih: ${sonuc['tarih']}, TBT: ${sonuc['temel_net']}, '
                      'KBT: ${sonuc['klinik_net']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => silSonuc(sonuc['id']),
              ),
            );
          },
        )
            : const Center(child: Text('No saved results found.')),
      ),
    );
  }
}
