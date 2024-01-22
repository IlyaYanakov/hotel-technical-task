import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/box_model.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotelDetailsCard extends StatelessWidget {
  final List<String> imageUrls;
  final int rating;
  final String ratingName;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;

  const HotelDetailsCard({
    Key? key,
    required this.imageUrls,
    required this.rating,
    required this.ratingName,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,

      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: const Text(
                'Отель',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),

              child: CarouselSlider.builder(
                options: CarouselOptions(height: 250, viewportFraction: 1),
                itemCount: imageUrls.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = imageUrls[index];
                  return buildImage(urlImage, index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 150,
                  height: 30,
                  color: Colors.yellow[200],
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 15,
                            width: 15,
                            child: Image(
                              image: AssetImage("assets/image/star.png"),
                            ),
                          ),
                          Text(
                            "$rating $ratingName",
                            style: const TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Colors.amber,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFProDisplay',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF0D72FF),
                textStyle: TextStyle(fontSize: 14),
              ),
              onPressed: () {},
              child: Text(
                address,
                style: const TextStyle(
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "от $minimalPrice ",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SFProDisplay',
                    fontSize: 30,
                  ),
                ),
                Text(
                  priceForIt,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF828796),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => SizedBox(
    width: double.infinity,
    height: 250,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    ),
  );
}
