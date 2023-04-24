import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));



// Body <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        title: const Text('DUS Buddy',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,

      ),
      drawer: const NavigationDrawer(),// Sidebar
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Takvim',
            backgroundColor: Colors.white70,

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Kişisel',
              backgroundColor: Colors.white70
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.backpack),
              label: 'Araçlar',
              backgroundColor: Colors.white70
          ),


        ]
      ),
      body: const Center(
        child: Text('Home Page'),
      ),

    );
  }
}

// Drawer Sidebar Menu <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context)
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Container(

  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          title: const Text('Sınav Sistemi'),
          onTap: (){},
        ),
        ListTile(
          title: const Text('Puan Türü Tablosu'),
          onTap: (){},
        ),
        ListTile(
          title: const Text('Soru Kitapçığı'),
          onTap: (){},
        ),
        ListTile(
          title: const Text('Haber Sayfası'),
          onTap: (){},
        ),
        const Divider(color: Colors.black54),
        ListTile(
          title: const Text('Ayarlar'),
          onTap: (){},
        ),
        ListTile(
          title: const Text('Hakkında'),
          onTap: (){},
        ),
      ],
    ),

  );
}




