import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_quran_and_prayer_time_app/ui/home_page/second.dart';
import 'package:the_quran_and_prayer_time_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 155,
              ),
              Image.asset(
                "assets/images/quran1.png",
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'My Quran',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.mainbtncolor),
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                height: 53,
                width: 200,
                child: TextButton(
                    style: ButtonStyle(
                      // side: MaterialStateBorderSide.resolveWith((states) => BorderSide()),
                      backgroundColor:
                          MaterialStatePropertyAll(Appcolors.mainbtncolor),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeconoPAge(),
                          ),
                          (route) => false);
                    },
                    child: Text(
                      "Read Now",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
