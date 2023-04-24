import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    Center(child: Text('Takvim', style: TextStyle(fontSize: 50))),
    Center(child: Text('Kişisel', style: TextStyle(fontSize: 50))),
    Center(child: Text('Araçlar', style: TextStyle(fontSize: 50))),
  ];


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
          //uncomment if you want footer navbar labels shown
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(()=> currentIndex = index),
          selectedFontSize: 12,
          items: const [
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
      body: screens[currentIndex],

    );
  }
}



// SideBar <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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

  Widget buildHeader(BuildContext context) => Container();

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          title: const Text('Sınav Sistemi'),
          onTap: (){
            Navigator.pushNamed(context, '/examinfo');
          },
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
          onTap: (){

          },
        ),
        const Divider(color: Colors.black54),
        ListTile(
          title: const Text('Ayarlar'),
          onTap: (){
            Navigator.pushNamed(context, '/settings');
          },
        ),
        ListTile(
          title: const Text('Hakkında'),
          onTap: (){
            Navigator.pushNamed(context, '/about');
          },
        ),
      ],
    ),

  );
}
