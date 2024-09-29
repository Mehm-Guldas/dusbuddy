import 'package:dusbuddy2/Pages/ProgressPage.dart';
import 'package:dusbuddy2/Pages/SavedResultsPage.dart';
import 'package:flutter/material.dart';

class KisiselPageBody extends StatelessWidget {
  const KisiselPageBody({
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
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressPage()),
                );},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(image: NetworkImage('assets/books.png'),
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 6,),
                    Text('Konu Ilerleme',
                      style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimaryContainer),
                    )
                  ],
                )
            ),


            InkWell(
                onTap: (){},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(image: NetworkImage('assets/progress.png'),
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 6,),
                    Text('Genel Ilerleme',
                      style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimaryContainer),
                    )
                  ],
                )
            ),
          ],),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: (){},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(image: NetworkImage('assets/books.png'),
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 6,),
                    Text('Denemelerim',
                      style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimaryContainer),
                    )
                  ],
                )
            ),


            InkWell(
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedResultsPage()),
                );},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(image: const NetworkImage('assets/results.png'),
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 6,),
                    Text('Sonuçlarım',
                      style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimaryContainer),
                    )
                  ],
                )
            ),
          ],),

      ],);
  }
}