import 'package:the_quran_and_prayer_time_app/data/model/prayermodel.dart';
import 'package:the_quran_and_prayer_time_app/data/network/api/api.dart';
import 'package:the_quran_and_prayer_time_app/data/network/api/universal.dart';

void main(List<String> args) {
  AllProductsRepository(aPiProvider: Prayerprovider()).fetchalltimes();
}

class AllProductsRepository {
  AllProductsRepository({required this.aPiProvider});
  Prayerprovider? aPiProvider;
  Future<PrayerModel?> fetchalltimes() async {
    UniversalResponse universalResponse = await aPiProvider!.getalltimes();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data;
    }
  }
}
