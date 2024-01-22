import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixer/models/reservation_model.dart';

class HotelInf extends StatelessWidget {
  final Reservation reservation;

  HotelInf({super.key,  required this.reservation});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.yellow[200]),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Row(
                          children: [
                            const SizedBox(
                                height: 15,
                                width: 15,
                                child: Image(
                                    image: AssetImage("assets/image/star.png"))),
                            Text(
                              "${reservation.hoRating} ${reservation.ratingName}",
                              style: const TextStyle(
                                color: Colors.amber, fontFamily: 'SFProDisplay',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Text(
                reservation.hotelName,
                style:
                const TextStyle(fontFamily: 'SFProDisplay', fontSize: 22, fontWeight: FontWeight.w500),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF0D72FF),
                  textStyle: const TextStyle(fontFamily: 'SFProDisplay', fontSize: 14),
                ),
                onPressed: () {},
                child: Text(reservation.hotelAddress),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
