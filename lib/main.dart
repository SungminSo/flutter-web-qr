import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

void main() => runApp(OauthQR());

class OauthQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: QRScreen(),
      ),
    );
  }
}

class QRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        child: Card(
          child: QRCode(),
        ),
      ),
    );
  }
}

class QRCode extends StatelessWidget {

  int _generateRandomToken() {
    Random rnd = new Random();
    int min = 100000;
    int max = 999999;
    return min + rnd.nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    final randomNumber = _generateRandomToken().toString();

    return Column(
      children: <Widget>[
        QrImage(
          data: randomNumber,
          size: 200,
        ),
        Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.all(6),
          child: Text(randomNumber),
        )
      ],
    );
  }
}