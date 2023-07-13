import 'package:dio/dio.dart';
import 'package:the_quran_and_prayer_time_app/data/model/prayermodel.dart';

class Prayerapi {
  static Future<List<PrayerModel>> getdattaa(int month) async {
    Response response = await Dio()
        .get('https://islomapi.uz/api/monthly?region=toshkent&month=$month');
    if (response.statusCode == 200) {
      final data = response.data;
      final decodedData =
          List<PrayerModel>.from(data.map((x) => PrayerModel.fromJson(x)));
      return decodedData;
    } else {
      throw Exception("Network Error");
    }
  }
  
}
