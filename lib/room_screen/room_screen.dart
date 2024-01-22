import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mixer/client/room_service.dart';
import '../models/box_model.dart';
import '../models/room_model.dart';
import '../reservation_screen/reservation_screen.dart';
import '../utils/Button.dart';

class RoomPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RoomPage> {
  late Future<List<Room>> futureRoom;

  @override
  void initState() {
    super.initState();
    futureRoom = fetchRoom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F9),
      body: FutureBuilder<List<Room>>(
        future: futureRoom,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyApp(rooms: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<Room> rooms;

  MyApp({super.key, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text('Steigenberger Makadi',
              style: TextStyle(fontFamily: 'SFProDisplay')),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              Room room = rooms[index];
              return buildRoomCard(context, room);
            },
          ),
        ),
      ],
    );
  }
}

Widget buildRoomCard(BuildContext context, Room room) => SizedBox(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(height: 250, viewportFraction: 1),
                  itemCount: room.imageUrls.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = room.imageUrls[index];
                    return buildImage(urlImage, index);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    room.name,
                    style: const TextStyle(
                        fontSize: 22,fontFamily: 'SFProDisplay', fontWeight: FontWeight.w500),
                  ),
                ),
                Wrap(
                  children: room.peculiarities
                      .map((facility) => buildBox(facility))
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: 180,
                      height: 30,
                      decoration: BoxDecoration(color: Colors.blue[100]),
                      child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Row(
                              children: [
                                Text(
                                  "Подробнее об отеле",
                                  style: TextStyle(
                                    color: Color(0xFF0D72FF),
                                    fontWeight: FontWeight.w500,fontFamily: 'SFProDisplay',
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image(
                                      image: AssetImage("assets/image/icon.png"),
                                      color: Color(0xFF0D72FF),
                                    )),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      room.price.toString(),
                      style: const TextStyle(fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w600, fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        room.pricePer,
                        style: const TextStyle(
                            fontSize: 16, fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF828796)),
                      ),
                    )
                  ],
                ),
                createButton("Зарезервировать", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReservationPage()),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    ));
