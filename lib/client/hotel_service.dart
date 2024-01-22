import 'dart:convert';

import '../models/hotel_model.dart';
import 'package:http/http.dart' as http;




Future<Hotel> fetchHotel() async {
  final response = await http.get(Uri.parse('https://run.mocky.io/v3/75000507-da9a-43f8-a618-df698ea7176d'));

  if (response.statusCode == 200) {
    return Hotel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load hotel');
  }
}

