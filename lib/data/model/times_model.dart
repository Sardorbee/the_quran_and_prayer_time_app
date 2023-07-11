
class Times {
    String tongSaharlik;
    String quyosh;
    String peshin;
    String asr;
    String shomIftor;
    String hufton;

    Times({
        required this.tongSaharlik,
        required this.quyosh,
        required this.peshin,
        required this.asr,
        required this.shomIftor,
        required this.hufton,
    });

    factory Times.fromJson(Map<String, dynamic> json) => Times(
        tongSaharlik: json["tong_saharlik"],
        quyosh: json["quyosh"],
        peshin: json["peshin"],
        asr: json["asr"],
        shomIftor: json["shom_iftor"],
        hufton: json["hufton"],
    );

    Map<String, dynamic> toJson() => {
        "tong_saharlik": tongSaharlik,
        "quyosh": quyosh,
        "peshin": peshin,
        "asr": asr,
        "shom_iftor": shomIftor,
        "hufton": hufton,
    };
}
