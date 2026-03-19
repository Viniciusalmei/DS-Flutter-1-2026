import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyLinks extends StatelessWidget {
  String url; 
  String image;
  MyLinks({super.key,required this.url, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.network(image),
      onTap: () async{
        Uri urlconvertido = Uri.parse(url);
        if(await canLaunchUrl(urlconvertido)){
          (await launchUrl(urlconvertido));
        }
      },
    )
    
    ;
  }
}