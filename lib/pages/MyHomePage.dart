import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/pages/destenition.dart';
import 'package:myapp/screens/Destination.dart';
import 'package:myapp/screens/page1.dart';

import 'hotels.dart';

class MyHomePage extends StatefulWidget {
  static final String id ='MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index=0;
  int _currenttab=0;
  Widget _cities(){
    return  Container(
      height: 310,

      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:destinations.length,itemBuilder:(ctx,index){
        Destination destination=destinations[index];
        return GestureDetector(
         onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(ctx)=>DestinationPage(destination:destination))),

          child: Container(
              margin: EdgeInsets.all(10),
              width: 210,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 1.0
                    ,child: Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${destination.activities.length}',style: TextStyle(fontSize:22.0 ),),
                          Text('${destination.description}',style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight:FontWeight.w600),)
                        ],
                      ),
                    ),
                  ),
                  ),
                  SizedBox(height: 5,),
                  Positioned(
                    top: 1,

                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0,2.0,),blurRadius: 20.0
                          )]
                      ),
                      child: Stack(
                        children: [
                          Hero(
                            tag:destination.imageUrl,
                            child: ClipRRect(
                              child: Image(
                                width: 220,
                                height: 220,
                                image: AssetImage(destination.imageUrl),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Padding(padding: EdgeInsets.only(left: 10,top: 120),child: Text(destination.city,style: TextStyle(letterSpacing: 1.2,color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),))
                              , Row(children: [
                                Padding(padding: EdgeInsets.only(left: 10),
                                    child: GestureDetector(onTap: (){print('hello');},
                                        child: Icon(Icons.map,color: Colors.deepPurple,))),
                                SizedBox(width: 10,),
                                Text(destination.country,style: TextStyle(color: Colors.white, fontSize: 18),)


                              ],)


                            ],)
                        ],
                      ),
                    ),
                  ),

                ],
              )
          ),
        );
      }),
    );
  }
  Widget _hotels(){
    return Container(
      height: 310,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:hotels.length,itemBuilder:(ctx,index){
        Hotel hotel =hotels[index];
        return Container(
            margin: EdgeInsets.all(10),
            width: 240,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 1.0
                  ,child: Container(
                  height: 120,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(hotel.name,style: TextStyle(fontSize:22.0 ),),
                        SizedBox(height: 7,),
                        Text(hotel.address,
                          style: TextStyle(fontSize: 20,color: Colors.grey,
                              fontWeight:FontWeight.w600),),
                        Text('\$${hotel.price}/night',style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                ),
                ),
                SizedBox(height: 5,),
                Positioned(
                  top: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0,2.0,),blurRadius: 20.0
                        )]
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          child: Image(
                            width: 240,
                            height: 220,
                            image: AssetImage(hotel.imageUrl),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            )
        );
      }),
    );
  }

  List<IconData> _icons=[
  Icons.shopping_cart_outlined,
    Icons.image,
    Icons.person,
    Icons.height
  ];
  Widget _icon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _index=index;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color:_index==index? Theme.of(context).primaryColor:Colors.grey[400],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(_icons[index],size: 30,color: Theme.of(context).accentColor,),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
          child:ListView(
            padding: EdgeInsets.symmetric(vertical: 30),
            children: [
            Padding(padding:EdgeInsets.only(left: 20,right: 120),child: Text('What would you liked to find ?',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold ),))
            ,SizedBox(height: 30,)
              // top #listView
              ,Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
            _icons.asMap().entries.map((MapEntry map) => _icon(map.key)).toList()

              ,),
              SizedBox(height: 15,),
              Page1(),
              _cities(),
                SizedBox(height: 20,),
              Page1(),
              SizedBox(height: 10,),
              _hotels(),
            ],) ,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currenttab,
        onTap: (int tape){
          setState(() {
            _currenttab=tape;
          });
          print(_currenttab);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map,size: 30,)
          ,label: 'home'),

          BottomNavigationBarItem(icon: Icon(Icons.local_pizza,size: 30,),label: 'home'),
          BottomNavigationBarItem(icon:CircleAvatar(radius: 15.0,backgroundImage: AssetImage('assets/images/hotel1.jpg'),),label: 'home')

        ],
      ),
        );
  }
}
