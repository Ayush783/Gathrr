import 'dart:convert';
import 'dart:developer' as dev;

import 'package:gathrr/home/model/event_response.dart';
import 'package:http/http.dart' as http;

import '../model/event.dart';

const String apiUrl =
    'https://organizergathrr.radarsofttech.in/api/getallevent';

class HomeService {
  //get events from api
  Future<EventRespnseModel> getEvents() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'userId': '1'},
      );
      // dev.log(response.body);
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
          jsonDecode(response.body)['allevents']);
      return EventRespnseModel.success(
        data
            .map(
              (e) => Event.fromJson(json: e),
            )
            .toList(),
      );
    } catch (e) {
      dev.log(e.toString());
      return EventRespnseModel.failure('Something went wrong!');
    }
  }
}
