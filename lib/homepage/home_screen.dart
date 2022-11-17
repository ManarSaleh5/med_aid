import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gp1_med_aid/settings/setting%20.dart';
import 'dart:developer';
import 'package:gp1_med_aid/chat/chats.dart';
class home extends StatefulWidget {
  @override
  List firstlist;
  home({Key? key, required this.firstlist}) : super(key: key);
 // home({Key? key}) : super(key: key);
  //  State<StatefulWidget> createState() => homeSt();
     _homeSt createState() => _homeSt();

}
List<int> ind = [
  1,
];

class _homeSt extends State<home> {
  @override
int glass_size = 0;
  int _page = 0;

  //debugPrint("");
  
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
   

    //  Material(
    //       clipBehavior: Clip.antiAlias,
    //       shape: BeveledRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //       topRight: Radius.circular(20.0),
    //        ),
    //       ),
    //        child: Container(
    //             height: 100,
    //             decoration: BoxDecoration(
    //             color: Color.fromARGB(255, 123, 165, 6),
    //          ),
    //       ),
    //     );
      return Scaffold(
         backgroundColor:Color(0xFF91c4aa),
        //ChatDetailPage
        bottomNavigationBar: CurvedNavigationBar(
           backgroundColor:Color(0xFF91c4aa),
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30 ),
            Icon(Icons.search, size: 30),
           // Icon(Icons.chat, size: 30),
                             IconButton(
                      icon: Icon( Icons.chat, size: 30,),
                   onPressed: (){  //Navigator.pushReplacement(context, MaterialPageRoute(
             //  builder: (context) =>privacy_page()
          //  builder: (_) => profile(
          //         firstlist: [id],
          //       )
     //)
   // );
Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ChatDetailPage(
                  firstlist: [widget.firstlist[2]],
                )));
    },
      
    ),
            Icon(Icons.lock_clock, size: 30),
           // Icon(Icons.settings, size: 30),
                                  IconButton(
                      icon: Icon( Icons.settings, size: 30,),
                   onPressed: (){  //Navigator.pushReplacement(context, MaterialPageRoute(
             //  builder: (context) =>privacy_page()
          //  builder: (_) => profile(
          //         firstlist: [id],
          //       )
     //)
   // );
Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => setting_screen(
                  firstlist: [widget.firstlist[2]],
                )));
    },
      
    ),

            
          ],
          onTap: (index) {
            setState(() {
              _page = index;
              
            });
          },
        ),
        body:
 SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Text(
                'Ads of the Day',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 181, 217, 240),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 20.0),
                    ],
                  ),
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.4),
                  //child: ad_slides(context)
                  ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Text(
                'Pharmacy on the friday shift:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
            ),
            // meals_found
            //     ? Column(
            //         children: [
            //           SingleChildScrollView(
            //             scrollDirection: Axis.horizontal,
            //             child: Row(
            //               children: <Widget>[
            //                 for (int ii = 0; ii < count; ii++)
            //                   for (int i in ind) addMeal(context, size, ii),
            //                 Padding(
            //                     padding: EdgeInsets.all(
            //                         MediaQuery.of(context).size.width * 0.01))
            //               ],
            //             ),
            //           ),
            //         ],
            //       )
                 Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.width * 0.05),
                    // child: Text(
                    //   "No Meals yet",
                    //   style: TextStyle(
                    //       color: Color.fromARGB(255, 136, 60, 89),
                    //       fontSize: 30,//size.width * 0.05,
                    //       fontWeight: FontWeight.w600),
                    // ),
                  ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Text(
                'Suggested Pharmacy ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      for (int ii = 0; ii < 3; ii++)
                        for (int i in ind) add_sug_pharmacy(context, size , ii),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.01))
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.04,
              ),
              // child: Text(
              //   'Body Check',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w600,
              //     fontSize: MediaQuery.of(context).size.width * 0.045,
              //     letterSpacing: 0.5,
              //     color: Color.fromARGB(255, 19, 33, 55),
              //   ),
              // ),
            ),
          //   summary(context, size, body_index),
          //   Padding(
          //     padding: EdgeInsets.only(
          //       top: MediaQuery.of(context).size.width * 0.02,
          //     ),
          //     child: Text(
          //       'Water Check',
          //       style: TextStyle(
          //         fontWeight: FontWeight.w600,
          //         fontSize: MediaQuery.of(context).size.width * 0.045,
          //         letterSpacing: 0.5,
          //         color: Color.fromARGB(255, 19, 33, 55),
          //       ),
          //     ),
          //   ),
          //   Padding(
          //     padding: EdgeInsets.only(
          //         top: MediaQuery.of(context).size.height * 0.02),
          //   ),
          //   water(context, size),
          //   Padding(
          //     padding: EdgeInsets.only(
          //         top: MediaQuery.of(context).size.height * 0.1),
          //   )
           ],
        ),
      ),





    //    Container (

        
    
    //     color: Color.fromARGB(255, 248, 248, 248),
    //    // padding: EdgeInsets.fromLTRB(50, 50, 200, 30),
    //     margin: EdgeInsets.fromLTRB(50, 90, 50, 50),
    //      padding: EdgeInsets.only(
    //           top: MediaQuery.of(context).size.height * 0.00,
    //                         bottom: MediaQuery.of(context).size.height * 0.01),
    //                      //Image.asset('assets/images/ph1 (2).png'),
                         
    //                     child: InkWell(
                        
    //                       onTap: (


    //                       ) {

    //                         Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (_) => setting_screen(
    //               firstlist: [widget.firstlist[2]],
    //             )));
    //                       },
    //        child: ClipRRect(
         
    //          borderRadius: BorderRadius.circular(20.0),
    //         child: Image.asset('assets/images/ph1 (2).png',
                
    //     //           width: 110.0, height: 110.0),
    //                      ),),),
 
        
    // ),
        
      
        
        
        
        
        );
        
  }}
  Widget add_sug_pharmacy(BuildContext context, Size size, int i) {
     var sug_pharmacy = ["Nour alyousef pharmacy", "IBN-SINA PHARMACY", "Rafidia Pharmacy"];
       var sug_image = [
    'assets/images/pharmacist.gif',
     'assets/images/pharmacy2.gif',
      'assets/images/pharma3.gif',
   
  ];
    return InkWell(
        onTap: () {
          //showAlertDialog(context, sug[i]);
        },
        child: Padding(
            padding: EdgeInsets.only(left: size.height * 0.03),
            child: Stack(
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(50.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(1.1, 4.0),
                          blurRadius: 8.0),
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: size.width * 0.36,
                            child: SizedBox(
                            child: Image.asset(sug_image[i]),
                            ),
                          ),
                          Text(
                           sug_pharmacy[i],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromARGB(255, 8, 73, 46),
                                fontSize: size.width * 0.044,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.03,right:size.height * 2 ),
                          ),
                        ],
                      )),
                ),
              ],
            )));
  }

  // Widget summary(BuildContext context, Size size, int i) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //         left: size.width * 0.05,
  //         right: size.width * 0.05,
  //         top: size.width * 0.04,
  //         bottom: size.width * 0.02),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(8.0),
  //             bottomLeft: Radius.circular(8.0),
  //             bottomRight: Radius.circular(8.0),
  //             topRight: Radius.circular(8.0)),
  //         boxShadow: <BoxShadow>[
  //           BoxShadow(
  //               color: Colors.grey.withOpacity(0.2),
  //               offset: Offset(1.1, 1.1),
  //               blurRadius: 10.0),
  //         ],
  //       ),
  //       child: Padding(
  //           padding: EdgeInsets.only(
  //               top: size.height * 0.04,
  //               left: size.width * 0.05,
  //               right: size.width * 0.05),
  //           child: Row(
  //             children: [
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Row(
  //                     children: [
  //                       InkWell(
  //                           onTap: () {
  //                             showAlertDialog2(context,
  //                                 "Body mass index is an easy screening method for weight categorization for underweight, healthy weight, overweight, obesity and extreme obesity");
  //                           },
  //                           child: Row(
  //                             children: [
  //                               Padding(
  //                                 padding: EdgeInsets.only(
  //                                     bottom: size.width * 0.02),
  //                                 child: Icon(
  //                                   Icons.error_outline,
  //                                   color: Color.fromARGB(255, 19, 33, 55),
  //                                 ),
  //                               ),
  //                               Container(
  //                                 padding: EdgeInsets.only(
  //                                     left: size.width * 0.007,
  //                                     bottom: size.width * 0.02),
  //                                 width: size.width * 0.32,
  //                                 child: Text(
  //                                   "Hey " + widget.firstlist[4],
  //                                   textAlign: TextAlign.center,
  //                                   style: GoogleFonts.poppins(
  //                                       color: Color.fromARGB(255, 218, 22, 97),
  //                                       fontSize: size.width * 0.037,
  //                                       fontWeight: FontWeight.w600),
  //                                 ),
  //                               ),
  //                             ],
  //                           )),
  //                     ],
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.only(bottom: size.width * 0.0),
  //                     width: size.width * 0.4,
  //                     child: Text(
  //                       'this is your Body Check',
  //                       textAlign: TextAlign.center,
  //                       style: GoogleFonts.poppins(
  //                           color: Color.fromARGB(255, 9, 78, 153),
  //                           fontSize: size.width * 0.035,
  //                           fontWeight: FontWeight.w600),
  //                     ),
  //                   ),
  //                   Row(
  //                     children: [
  //                       Padding(
  //                         padding: EdgeInsets.only(),
  //                         child: Text(widget.firstlist[1],
  //                             textAlign: TextAlign.center,
  //                             style: GoogleFonts.poppins(
  //                               fontWeight: FontWeight.w600,
  //                               fontSize: size.width * 0.05,
  //                               color: Color.fromARGB(255, 218, 22, 97),
  //                             )),
  //                       ),
  //                       Padding(
  //                         padding: EdgeInsets.only(
  //                           bottom: size.height * 0,
  //                           left: size.width * 0.01,
  //                         ),
  //                         child: Text(
  //                           'Kg',
  //                           textAlign: TextAlign.center,
  //                           style: GoogleFonts.poppins(
  //                             fontWeight: FontWeight.w600,
  //                             fontSize: size.width * 0.035,
  //                             letterSpacing: -0.2,
  //                             color: Color.fromARGB(255, 19, 33, 55),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.end,
  //                         children: <Widget>[
  //                           Padding(
  //                             padding: EdgeInsets.only(),
  //                             child: Text(widget.firstlist[2],
  //                                 textAlign: TextAlign.center,
  //                                 style: GoogleFonts.poppins(
  //                                   fontWeight: FontWeight.w600,
  //                                   fontSize: size.width * 0.05,
  //                                   color: Color.fromARGB(255, 218, 22, 97),
  //                                 )),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(
  //                               bottom: size.height * 0.005,
  //                               left: size.width * 0.01,
  //                             ),
  //                             child: Text(
  //                               'cm',
  //                               textAlign: TextAlign.center,
  //                               style: GoogleFonts.poppins(
  //                                 fontWeight: FontWeight.w600,
  //                                 fontSize: size.width * 0.035,
  //                                 letterSpacing: -0.2,
  //                                 color: Color.fromARGB(255, 19, 33, 55),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.end,
  //                         children: <Widget>[
  //                           Container(
  //                             width: size.width * 0.3,
  //                             padding: EdgeInsets.only(
  //                               left: size.width * 0.01,
  //                               right: size.width * 0.01,
  //                             ),
  //                             child: Text("Your BMI:",
  //                                 textAlign: TextAlign.center,
  //                                 style: GoogleFonts.poppins(
  //                                   fontWeight: FontWeight.w500,
  //                                   fontSize: size.width * 0.035,
  //                                   color: Color.fromARGB(255, 19, 33, 55),
  //                                 )),
  //                           ),
  //                           Text(BMI.toStringAsFixed(1),
  //                               textAlign: TextAlign.center,
  //                               style: GoogleFonts.poppins(
  //                                 fontWeight: FontWeight.w600,
  //                                 fontSize: size.width * 0.035,
  //                                 color: Color.fromARGB(255, 218, 22, 97),
  //                               )),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.end,
  //                         children: <Widget>[
  //                           Container(
  //                             width: size.width * 0.3,
  //                             padding: EdgeInsets.only(
  //                                 top: size.height * 0.0,
  //                                 left: size.width * 0.01,
  //                                 right: size.width * 0.01,
  //                                 bottom: size.height * 0.01),
  //                             child: Text("Your body is " + body_names[i],
  //                                 textAlign: TextAlign.center,
  //                                 style: GoogleFonts.poppins(
  //                                   fontWeight: FontWeight.w600,
  //                                   fontSize: size.width * 0.03,
  //                                   color: Color.fromARGB(255, 19, 33, 55),
  //                                 )),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.end,
  //                         children: <Widget>[
  //                           Container(
  //                             width: size.width * 0.4,
  //                             padding: EdgeInsets.only(
  //                                 top: size.height * 0.0,
  //                                 left: size.width * 0.01,
  //                                 right: size.width * 0.01,
  //                                 bottom: size.height * 0.03),
  //                             child: Text(body_adv[i],
  //                                 textAlign: TextAlign.center,
  //                                 style: GoogleFonts.poppins(
  //                                   fontWeight: FontWeight.w600,
  //                                   fontSize: size.width * 0.03,
  //                                   color: Color.fromARGB(255, 218, 22, 97),
  //                                 )),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     padding: EdgeInsets.only(
  //                       right: size.width * 0.03,
  //                     ),
  //                     width: size.width * 0.34,
  //                     height: size.height * 0.34,
  //                     child: Image.asset(
  //                       body_images[i],
  //                       fit: BoxFit.cover,
  //                     ),
  //                   )
  //                 ],
  //               )
  //             ],
  //           )),
  //     ),
  //   );
  // }