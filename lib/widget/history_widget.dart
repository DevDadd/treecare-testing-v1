import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryWidget extends StatelessWidget {
   HistoryWidget({super.key, required this.disease,required this.imageurl, required this.species});
  String species;
  String disease;
  String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(imageurl), radius: 50,),
          SizedBox(width: 10,),
          Column(
            children: [
              Text(species),
              SizedBox(height: 10,),
              Text(disease),
            ],
          )
        ],
      ),
    );
  }
}