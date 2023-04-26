import 'package:flutter/material.dart';

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
                onTap: (){},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(image: NetworkImage('assets/books.png'),
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 6,),//puan hesaplamayı sadece osym ayarlayacakmış
                    const Text('Net Hesaplama',//biz 4 yanlış bir doğruyu goturecek şekilde net sayısını hesaplayacagiz
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
                    const Text('Ajanda',
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
                    const Text('DUS Sayfası',
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
                    const Text('Haberler',
                      style: TextStyle(fontSize: 24, color: Colors.black87),
                    )
                  ],
                )
            ),
          ],),

      ],);
  }
}
//TEMEL BİLİMLER
//Anatomi 6 soru
// Histoloji ve Embriyoloji 4 soru
// Fizyoloji 6 soru
// Tıbbi Biyokimya 6 soru
// Tıbbi Mikrobiyoloji 6 soru
// Tıbbi Patoloji 4 soru
// Tıbbi Farmakoloji 4 soru
// Tıbbi Biyoloji veGenetik 4soru

//TEMEL TIP DERSLERİ
// Protetik Diş Tedavisi 10 soru
// Restoratif Diş Tedavisi 10 soru
// Ağız, Diş ve Çene Cerrahisi 10 soru
// Ağız, Diş ve Çene Radyolojisi 10 soru
// Periodontoloji 10 soru
// Endodonti 10 soru
// Ortodonti 10 Soru
// Çocuk Diş Hekimliği 10 soru
//toplamda 120 soru aynı deneme sınavı içinde