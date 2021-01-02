import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/pages/activities.dart';
import 'package:myapp/pages/destenition.dart';

class DestinationPage extends StatefulWidget {
  final Destination destination;
  DestinationPage({this.destination});
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {

  Widget _anoteher(){
    return Expanded(child:ListView.builder(scrollDirection:Axis.vertical,itemCount:widget.destination.activities.length ,
        itemBuilder: (ctx,index){
          Activity activities =widget.destination.activities[index];
          return Stack(children: [
            Container(height: 170,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              padding: EdgeInsets.fromLTRB(40, 5, 20, 5),
              decoration:BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(100, 20, 20, 20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 120,child: Text(activities.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                        Text('\$${activities.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600))

                      ],),
                    SizedBox(height: 7,),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(activities.type,style: TextStyle(color: Colors.grey),)),
                    // _building(activities.rating)
                    SizedBox(height: 10,),
                    Row(children: [
                      Container(
                        height: 15,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent[100],
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text(activities.startTimes[0])),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 15,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent[100],
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text(activities.startTimes[1])),
                      )
                    ],)


                  ],
                ),
              )


              ,),
            Positioned(
              top: 15,
              left: 20,
              bottom: 15,


              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  width: 100,
                  image: AssetImage(activities.imageUrl),
                  fit: BoxFit.cover,

                ),

              ),
            )

          ],);



        }));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,body:Column(children: [
      Stack(children: [
        Container(height: 330,
          decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),
                  bottomLeft:Radius.circular(30)),
            boxShadow:[BoxShadow(
              color: Colors.black26,
              blurRadius: 20.0,
              offset: Offset(0.0,2.0)
            )]

          ),
          child: Hero(
            tag: widget.destination.imageUrl,
            child: ClipRRect(borderRadius:BorderRadius.only(bottomRight: Radius.circular(30),
        bottomLeft:Radius.circular(30)) ,child: Image(image: AssetImage(widget.destination.imageUrl),fit: BoxFit.cover,)),
          ),
        ),
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
          IconButton(icon:Icon(Icons.arrow_back), onPressed:()=>Navigator.pop(context),
            color: Colors.white,),
          Row(children: [IconButton(icon:Icon(Icons.search), onPressed:()=>Navigator.pop(context),
            color: Colors.white,),
            IconButton(icon:Icon(Icons.image), onPressed:()=>Navigator.pop(context),
            color: Colors.white,)],),

          ],
        ),Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(padding: EdgeInsets.only(left: 10,top: 120),child: Text(widget.destination.city,style: TextStyle(letterSpacing: 1.2,color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),))
              , Row(children: [
                Padding(padding: EdgeInsets.only(left: 10),
                    child: GestureDetector(onTap: (){print('hello');},
                        child: Icon(Icons.map,color: Colors.deepPurple,))),
                SizedBox(width: 10,),
                Text(widget.destination.country,style: TextStyle(color: Colors.white, fontSize: 18),)],)],),
               ),
               Positioned(bottom:20,right:20,child: Icon(Icons.map,color: Colors.deepPurple,),),],
              ),
              // country prices and times
              _anoteher()
                 ,
    ],),);
  }
}
