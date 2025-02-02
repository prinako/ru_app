import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:ru_app/data/ru_data.dart';

class NewsCarouselSlider extends StatelessWidget {
  const NewsCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfImages = context.watch<Data>().listOfNews;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 250.0,
      ),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: double.infinity,
          autoPlay: true,
          enlargeCenterPage: true,
          animateToClosest: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayInterval: const Duration(seconds: 8),
          autoPlayAnimationDuration: const Duration(milliseconds: 900),
          viewportFraction: 1,
        ),
        itemCount: listOfImages.length,
        itemBuilder: (context, index, realIndex) {
          final listOfNoticias = listOfImages[index];
          final isImage = listOfImages[index]['isImage'];
          return Card(
            color: !isImage ? Color(listOfNoticias['textColor']) : Colors.white,
            // margin: const EdgeInsets.symmetric(vertical: 1),
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: isImage
                  ? const EdgeInsets.all(0.0)
                  : const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: isImage
                      ? CachedNetworkImage(
                          imageUrl: listOfNoticias['imageUrl'],
                          fit: BoxFit.cover,
                        )
                      : Column(
                          children: [
                            Text(
                              listOfNoticias['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Flexible(
                              child: Text(
                                listOfNoticias['msg'],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
