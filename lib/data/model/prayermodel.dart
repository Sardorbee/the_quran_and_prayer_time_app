

import 'dart:convert';

import 'package:the_quran_and_prayer_time_app/data/model/times_model.dart';


List<PrayerModel> prayerModelFromJson(String str) => List<PrayerModel>.from(json.decode(str).map((x) => PrayerModel.fromJson(x)));

String prayerModelToJson(List<PrayerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrayerModel {
    String region;
    DateTime date;
    int month;
    int day;
    String weekday;
    Times times;

    PrayerModel({
        required this.region,
        required this.date,
        required this.month
        ,required this.day,
        required this.weekday,
        required this.times,
    });

    factory PrayerModel.fromJson(Map<String, dynamic> json) => PrayerModel(
        region: json["region"],
        date: DateTime.parse(json["date"]),
        day: json["day"],
        month: json["month"],
        weekday: json["weekday"],
        times: Times.fromJson(json["times"]),
    );

    Map<String, dynamic> toJson() => {
        "region": region,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day,
        "month": month,
        "weekday": weekday,
        "times": times.toJson(),
    };
}
