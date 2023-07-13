import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_quran_and_prayer_time_app/data/model/prayermodel.dart';
import 'package:the_quran_and_prayer_time_app/data/network/api/api.dart';
import 'package:the_quran_and_prayer_time_app/utils/colors.dart';

class SeconoPAge extends StatefulWidget {
  const SeconoPAge({Key? key}) : super(key: key);

  @override
  State<SeconoPAge> createState() => _SeconoPAgeState();
}

class _SeconoPAgeState extends State<SeconoPAge> {
  Future<List<PrayerModel>>? _prayerData;

  @override
  void initState() {
    super.initState();
    _prayerData = Prayerapi.getdattaa(DateTime.now().month);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.mainbg,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Namoz vaqtlari",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        "assets/images/notification.png",
                        height: 47,
                      )
                    ],
                  ),
                  const Text(
                    "Toshkent",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "-01.38.56",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text("")
                    ],
                  )
                ],
              ),
            ),
            FutureBuilder<List<PrayerModel>>(
              future: _prayerData,
              builder: (BuildContext context,
                  AsyncSnapshot<List<PrayerModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return const Stack(
                    children: [],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
