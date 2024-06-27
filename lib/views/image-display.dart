import 'package:flutter/material.dart';

class ImageDispaly extends StatelessWidget {
  ImageDispaly({required this.imgurl, required this.title});

  final String imgurl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleTextStyle: TextStyle(color: Colors.pink),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55),
        child: Column(
          children: [
            Container(
              height: double.maxFinite,
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
