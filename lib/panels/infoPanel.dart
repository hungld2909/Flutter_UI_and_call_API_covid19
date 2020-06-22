import 'package:flutter/material.dart';
import 'package:project_covid_19/datasorce.dart';
import 'package:project_covid_19/pages/fags.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (contex)=> FAQPage()));
            },
                      child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: primaryBlack,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "FAQS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch("https://covid19responsefund.org/");
            },
                      child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: primaryBlack,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "DONATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch(
                  "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: primaryBlack,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "MYTH BUSTERS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
