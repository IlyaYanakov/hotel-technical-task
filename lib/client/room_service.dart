import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/room_model.dart';


Future<List<Room>> fetchRoom() async {
  final response = await http.get(Uri.parse('https://run.mocky.io/v3/157ea342-a8a3-4e00-a8e6-a87d170aa0a2'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonRooms = json.decode(response.body)['rooms'];
    return jsonRooms.map((room) => Room.fromJson(room)).toList();
  } else {
    throw Exception('Failed to load hotel');
  }
}



