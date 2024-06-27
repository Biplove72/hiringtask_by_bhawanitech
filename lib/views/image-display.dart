import 'package:flutter/material.dart';

class ImageDispaly extends StatelessWidget {
  ImageDispaly({required this.imgurl, required this.title});

  final String imgurl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.yellow,
              child: Image.network(
                imgurl,
                fit: BoxFit.cover,
              ),
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
