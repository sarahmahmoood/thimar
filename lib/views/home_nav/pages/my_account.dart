import 'package:flutter/material.dart';

class MyAccountPageView extends StatelessWidget {
  const MyAccountPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "حسابي",
          style: TextStyle(fontSize: 20),
        )),
      ),
      body: ListView(
        //padding: EdgeInsets.symmetric(vertical: 19,horizontal: 21),
        children: [
          Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("assets/images/person.png")),
          SizedBox(
            height: 2,
          ),
          Text(
            "محمد علي",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "+96654787856",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffA2D273)),
          ),
          SizedBox(
            height: 41,
          ),
          ItemProfile(image: "User.png", title: "البيانات الشخصية"),
          ItemProfile(image: "Wallet.png", title: "المحفظة"),
          ItemProfile(image: "Location.png", title: "العناوين"),
          ItemProfile(image: "payment.png", title: "الدفع"),
          ItemProfile(image: "Question.png", title: "أسئلة متكررة"),
          ItemProfile(image: "check.png", title: "سياسة الخصوصية"),
          ItemProfile(image: "contact.png", title: "تواصل معنا"),
          ItemProfile(image: "suggestion.png", title: "الشكاوي والأقتراحات"),
          ItemProfile(image: "Info.png", title: "مشاركة التطبيق"),
          ItemProfile(image: "about app.png", title: "عن التطبيق"),
          ItemProfile(image: "language.png", title: "تغيير اللغة"),
          ItemProfile(image: "ahkam.png", title: "الشروط والأحكام"),
          ItemProfile(image: "rate.png", title: "تقييم التطبيق"),
          ItemProfile(image: "signout.png", title: "تسجيل الخروج"),
        ],
      ),
    );
  }
}

class ItemProfile extends StatelessWidget {
  final String image, title;

  const ItemProfile({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/$image",
              width: 20, height: 20, fit: BoxFit.scaleDown),
          SizedBox(
            width: 18,
          ),
          Text(title,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700,color: Color(0xff4C8613))),
        ],
      ),
    );
  }
}
