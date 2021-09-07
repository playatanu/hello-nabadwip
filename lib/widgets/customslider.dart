import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enableInfiniteScroll: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        Container(
          width: 500,
          decoration: BoxDecoration(
              color: Color(0xFF1E1F41),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'FHFDshsf',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 500,
          decoration: BoxDecoration(
              color: Color(0xFF1E1F41),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'FHFDshsf',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 500,
          decoration: BoxDecoration(
              color: Color(0xFF1E1F41),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'FHFDshsf',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
