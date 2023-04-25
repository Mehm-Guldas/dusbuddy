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
                onTap: (){},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(image: NetworkImage('assets/books.png'),
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 6,),
                    const Text('Konu Ilerleme',
                      style: TextStyle(fontSize: 24, color: Colors.black87),
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
                    const Text('Genel Ilerleme',
                      style: TextStyle(fontSize: 24, color: Colors.black87),
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
                    const Text('Denemelerim',
                      style: TextStyle(fontSize: 24, color: Colors.black87),
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
                    const Text('Programlarım',
                      style: TextStyle(fontSize: 24, color: Colors.black87),
                    )
                  ],
                )
            ),
          ],),

      ],);
  }
}