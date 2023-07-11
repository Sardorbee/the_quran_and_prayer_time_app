

import 'dart:convert';

import 'package:the_quran_and_prayer_time_app/data/model/times_model.dart';

PrayerModel prayerModelFromJson(String str) => PrayerModel.fromJson(json.decode(str));

String prayerModelToJson(PrayerModel data) => json.encode(data.toJson());

class PrayerModel {
    String region;
    DateTime date;
    String weekday;
    Times times;

    PrayerModel({
        required this.region,
        required this.date,
        required this.weekday,
        required this.times,
    });

    factory PrayerModel.fromJson(Map<String, dynamic> json) => PrayerModel(
        region: json["region"],
        date: DateTime.parse(json["date"]),
        weekday: json["weekday"],
        times: Times.fromJson(json["times"]),
    );

    Map<String, dynamic> toJson() => {
        "region": region,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "weekday": weekday,
        "times": times.toJson(),
    };
}
