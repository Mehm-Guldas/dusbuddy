import 'package:dusbuddy2/Pages/CalendarPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher paketi eklendi
import '../Pages/netHesaplama.dart';

class AraclarPageBody extends StatelessWidget {
  const AraclarPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NetHesaplama()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('assets/clipboard.png'),
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Net Hesaplama',
                    style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('assets/schedule.png'),
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Takvim',
                    style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


            InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('assets/progress.png'),
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Puan Hesaplama',
                    style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                const url = 'https://www.osym.gov.tr/TR,8872/hakkinda.html';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'URL açılamıyor: $url';
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('assets/newspaper.png'),
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Haberler',
                    style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
