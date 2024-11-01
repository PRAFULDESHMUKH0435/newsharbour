import 'package:flutter/material.dart';
import 'package:newsharbour/Constants/apiurls.dart';
import 'package:newsharbour/Screens/LoadNewsByCategory.dart';

class ReUsablecontainer extends StatelessWidget {
  final String label;
   const ReUsablecontainer({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    String selectedurl=ApiUrls.politicsendpointurl;
    return GestureDetector(
      onTap: (){
        if(label=="Technology"){
          selectedurl=ApiUrls.internationalendpointurl;
        }else if(label=="Sports"){
          selectedurl=ApiUrls.sportsendpointurl;
        }else if(label=="Economy"){
          selectedurl=ApiUrls.economyendpointurl;
        }else if(label=="StartUps"){
          selectedurl=ApiUrls.startupendpointurl;
        }else if(label=="AI"){
          selectedurl=ApiUrls.aiendpointurl;
        }else{
          selectedurl=ApiUrls.politicsendpointurl;
        }
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadNewsByCategory(endpinturl: selectedurl,Title: label,)));
      },
      child: Container(
        child: Card(
          color:Colors.blue,
          elevation: 4.0,
          shadowColor: Colors.white,
          child: Container(
            height: 150,
            width: 150,
            margin:const EdgeInsets.all(5.0),
            child: Center(child: Text(label,style: const TextStyle(fontSize: 24,fontWeight:FontWeight.bold),)),
          ),
        ),
      ),
    );
  }
}