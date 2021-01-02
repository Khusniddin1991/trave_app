import 'package:flutter/material.dart';
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Top  Destinations',style: TextStyle(fontSize:22.0,fontWeight: FontWeight.bold,letterSpacing: 1.0),),
          SizedBox(width: 120,),
          GestureDetector(onTap: (){},child: Text('See All',style: TextStyle(fontSize:18.0,fontWeight: FontWeight.w600,letterSpacing: 1.0,color: Theme.of(context).primaryColor),))


        ],),




    ],);
  }
}
