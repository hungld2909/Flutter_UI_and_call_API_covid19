import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import '../datasorce.dart';
class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);


  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryBlack,
      brightness: DynamicTheme.of(context).brightness
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
       query='';
      //! phương thức hành động, để nhập vào các dòng text
     })
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //! dùng để trở lại trang cũ
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    //! kết quả
    // trả lại một khoảng trống cho kết quả và các gợi ý đúng có ý nghĩa
return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    //! kết quả và xây dựng đề xuất 
    final suggestionList
         =
           query.isEmpty?
           countryList:
           countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

   return ListView.builder(
       itemCount: suggestionList.length,
       itemBuilder: (context,index){
     return Card(
       child: Container(
         height: 130,
         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         child: Row(
           children: <Widget>[
             Container(
               width: 200,
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     suggestionList[index]['country'],
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                   Image.network(
                     suggestionList[index]['countryInfo']['flag'],
                     height: 50,
                     width: 60,
                   ),
                 ],
               ),
             ),
             Expanded(
                 child: Container(
                   child: Column(
                     children: <Widget>[
                       Text(
                         'CONFIRMED:' +
                             suggestionList[index]['cases'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.red),
                       ),
                       Text(
                         'ACTIVE:' +
                             suggestionList[index]['active'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.blue),
                       ),
                       Text(
                         'RECOVERED:' +
                             suggestionList[index]['recovered'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.green),
                       ),
                       Text(
                         'DEATHS:' +
                             suggestionList[index]['deaths'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color:  Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                       ),
                     ],
                   ),
                 ))
           ],
         ),
       ),
     );
   });
  }

}