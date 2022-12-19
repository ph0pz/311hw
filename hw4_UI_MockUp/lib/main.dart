import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(title: "First",
    debugShowCheckedModeBanner: false,
  theme: ThemeData(primaryColor: Colors.black),
  home: Myhome(),));
}
class Myhome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: const IconButton(
          icon : Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 245, 203, 234),
          ),
          tooltip: "Navigation Menu",
          onPressed: null,
      ),
        centerTitle: true,
        title: const Text(
          'Chiang Mai',
          style: TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold),
        ),
        actions: const[
          IconButton(onPressed: null,
              icon: Icon(Icons.ios_share,
              color:Color.fromARGB(255, 245, 203, 234) ,
              )),
          IconButton(onPressed: null,
              icon: Icon(Icons.favorite_border,
                  color : Colors.white))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 19 / 6,
                  child: Image.network(
                    "https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_360,q_auto,w_360/itemimages/74/31/743191_v4.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 6,
                  right : 1,
                  left: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.circle, color: Colors.white , size: 10),
                        SizedBox(width: 3),
                        Icon(Icons.circle, color: Colors.white , size: 7),
                        SizedBox(width: 3),
                        Icon(Icons.circle, color: Colors.white , size: 7),
                        SizedBox(width: 3),
                        Icon(Icons.circle, color: Colors.white , size: 7),
                        SizedBox(width: 3),
                        Icon(Icons.circle, color: Colors.white , size: 7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  right: 10,
                  child: Container(
                    width: 60,
                    height: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.photo_library_outlined,
                            color: Colors.white ,size : 15),
                        Text(
                          ' 61',
                          style: TextStyle(
                            color: Colors.grey,fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children:  [
                const Text('UNESCO Sustainable Travel Pledge', style: TextStyle(color: Colors.grey,fontSize: 12)),
                const Text('Shangri-La Chiang Mai', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.grey, size : 15),
                    Icon(Icons.star, color: Colors.grey, size : 15),
                    Icon(Icons.star, color: Colors.grey, size : 15),
                    Icon(Icons.star, color: Colors.grey, size : 15),
                    Icon(Icons.star, color: Colors.grey, size : 15),
                  ],
                ),
                Text('Luxury hotel with free water park, near Chiang Mai Night Bazaar', style: TextStyle(color: Colors.grey.shade400,fontSize : 19)),
                 const SizedBox(height: 40),
                 const Text('9.0/10 Superb', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                 const SizedBox(height: 15),
                 const Text('1,000 verified Hotels.com guest reviews', style: TextStyle(color: Colors.grey,fontSize: 13)),
                 const SizedBox(height: 5),
                 Text('See all 1,000 reviews     >', style: TextStyle(color: Colors.lightBlue.shade200,fontSize: 13)),
                 const SizedBox(height: 30),
                 const Text('Popular amenities', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                 Row(

                   children: [
                     Container(
                       alignment: Alignment.centerLeft,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           // First row
                           Row(
                             children: [
                               Icon(Icons.wifi, color: Colors.grey.shade400),
                               Text('   Free Wifi', style: TextStyle(color: Colors.grey.shade400)),

                             ],
                           ),
                           const SizedBox(width: 30),
                           // Second row
                           Row(
                             children: [
                               Icon(Icons.ac_unit, color: Colors.grey.shade400),
                               Text('   Air conditioning', style: TextStyle(color: Colors.grey.shade400)),
                             ],
                           ),
                           // Third row
                           const SizedBox(width: 30),
                           Row(
                             children: [
                               Icon(Icons.fitness_center, color: Colors.grey.shade400),
                               Text('   Gym', style: TextStyle(color: Colors.grey.shade400)),
                             ],
                           ),
                         ],
                       ),
                     ),

                     const SizedBox(width: 70),
                     Container(
                       alignment: Alignment.centerRight,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           // First row
                           Row(
                             children: [
                               Icon(Icons.pool, color: Colors.grey.shade400),
                               Text('   Pool', style: TextStyle(color: Colors.grey.shade400)),
                             ],
                           ),

                           // Second row
                           const SizedBox(width: 30),
                           Row(
                             children: [
                               Icon(Icons.directions_car, color: Colors.grey.shade400),
                               Text('   Free parking', style: TextStyle(color: Colors.grey.shade400)),
                             ],
                           ),
                           // Third row
                           const SizedBox(width: 30),
                           Row(
                             children: [
                               Icon(Icons.thermostat, color: Colors.grey.shade400),
                               Text('   Refrigerator', style: TextStyle(color: Colors.grey.shade400)),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ],
                 )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 12 / 2,
                  child: Image.network(
                    "data:image/jpeg;base64,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",
                    fit: BoxFit.fill,

                  ),
                ),

                Positioned(
               // Set the right position to 0
                  child: Container(
                    width: 1000,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade300,
                        borderRadius: BorderRadius.circular(30)),
                   child: InkWell(
                      onTap: () {
                      },
                     child:
                     const Center(
                       child: Text(
                         'Select a room',
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,fontWeight: FontWeight.bold
                         ),
                       ),
                     ),
                    ),
                  ),
                ),
              ],

            ),
          ),

        ],

      ),




    );
  }
}