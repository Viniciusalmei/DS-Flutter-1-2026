import 'package:flutter/material.dart';
import 'package:teste/components/links.dart';

class TelaLinks extends StatelessWidget {
  const TelaLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        MyLinks(url: "https://github.com/Viniciusalmei", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5ZIuGTjzp1JTeaqZPCvO95rD_vTeKEKIH3g&s")
      ],),
    );
  }
}