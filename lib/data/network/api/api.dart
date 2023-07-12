import 'package:dio/dio.dart';
import 'package:the_quran_and_prayer_time_app/data/model/prayermodel.dart';

class Prayerapi {
  static Future<PrayerModel> getdattaa() async {
    Response response =
        await Dio().get('https://islomapi.uz/api/present/day?region=Toshkent');
    if (response.statusCode == 200) {
      final data = response.data;
      return PrayerModel.fromJson(data);
    } else {
      throw Exception("Network Error");
    }
  }
}
