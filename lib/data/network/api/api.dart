import 'package:the_quran_and_prayer_time_app/data/model/prayermodel.dart';
import 'package:the_quran_and_prayer_time_app/data/network/api/universal.dart';
import 'package:http/http.dart' as http;

class Prayerprovider {
  Future<UniversalResponse> getalltimes() async {
    Uri uri = Uri.parse("https://islomapi.uz/api/present/day?region=Toshkent");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        // print(response.body);
        return UniversalResponse(data: prayerModelFromJson(response.body));
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}
