import 'package:flutter/material.dart';
import 'package:project_covid_19/datasorce.dart';
class FAQPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQS"),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index){
        return ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),children: <Widget>[
          Text(DataSource.questionAnswers[index]['answer'])
        ],);
      }),
    );
  }
}