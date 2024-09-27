import 'package:flutter/material.dart';
import 'package:dusbuddy2/Menubodies/personalbody.dart';
import 'package:dusbuddy2/Menubodies/toolsbody.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chronometer_screen.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    //First Body Takvim Page <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    ChronometerScreen(),

    //Second Body Kisisel Page <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    KisiselPageBody(),

    //Third Body Araclar Page <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    AraclarPageBody(),
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
              label: 'Kronometre',
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
          title: Text('Puan Türü Tablosu'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Soru Kitapçığı'),
          onTap: (){},
        ),
        const ListTile(
          title: Text('Haber Sayfası'),
          onTap: Launchhaberler,
        ),
        const ListTile(
          title: Text('Kılavuzlar'),
          onTap: Launchkilavuzlar,
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



Launchhaberler() async {
  const url = 'https://www.osym.gov.tr/TR,8872/hakkinda.html';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}


Launchkilavuzlar() async {
  const url = 'https://www.osym.gov.tr/TR,8872/hakkinda.html';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

//degisklik 2
