import 'package:flutter/material.dart';
import 'package:the_quran_and_prayer_time_app/data/model/prayermodel.dart';
import 'package:the_quran_and_prayer_time_app/data/network/api/api.dart';
import 'package:the_quran_and_prayer_time_app/utils/colors.dart';

class SeconoPAge extends StatefulWidget {
  const SeconoPAge({super.key});

  @override
  State<SeconoPAge> createState() => _SeconoPAgeState();
}

class _SeconoPAgeState extends State<SeconoPAge> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.mainbg,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FutureBuilder(
              future: Prayerapi.getdattaa(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                 final data = snapshot.data;
                  return Stack(
                    children: [
                      Image.asset(
                        'assets/images/bg.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "My Quran",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data!.region,
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data!.date.toString().substring(0, 11),
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data!.weekday,
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Asr: ${data!.times.asr}",
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Hufton: ${data!.times.hufton}",
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Peshin: ${data!.times.peshin}",
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Quyosh: ${data!.times.quyosh}",
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "ShomIftor: ${data!.times.shomIftor}",
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Tong Saharlik: ${data!.times.tongSaharlik}",
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
