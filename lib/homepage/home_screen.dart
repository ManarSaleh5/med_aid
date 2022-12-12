import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gp1_med_aid/settings/setting%20.dart';
import 'dart:developer';
//import 'package:gp1_med_aid/chat/chats.dart';
import 'package:gp1_med_aid/chat/chatai.dart';
 import 'package:gp1_med_aid/pharmacy/pharmacy1.dart';
 import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../http.dart';
import '../reminder/notification.dart';
import '../reminder/reminder1.dart';
import '../search.dart';

class home extends StatefulWidget {
  @override
  List firstlist;
  home({Key? key, required this.firstlist}) : super(key: key);
 // home({Key? key}) : super(key: key);
  //  State<StatefulWidget> createState() => homeSt();
     _homeSt createState() => _homeSt();

}
List<int> ind = [
  0,1,2
];
List<String> myinfo = [];
List<String> myinfo1 = [];
int j=0;
 var sug_pharmacy1=[" "," "," ",];
  //var sug_pharmacy = ["Nour alyousef pharmacy", "IBN-SINA PHARMACY", "Rafidia Pharmacy"];
       var sug_image = [
    'assets/images/pharmacist.gif',
     'assets/images/pharmacy2.gif',
      'assets/images/pharma3.gif',
   
  ];
  
  //   void initState() {
  //   show_accountinfo();
  //   super.initState();
  // }
   var images=[
'assets/images/adds1 _.jpg',
'assets/images/adds2.jpg',
'assets/images/adds3.jpg'
   ];
   String shift="";
  var p=["chat","1","2"];
class _homeSt extends State<home> {
  
int glass_size = 0;
  int _page = 0;
 show_pharmciesinfo() async {
      var result = await http_get("pharmciesinfo", {
      "id": widget.firstlist[0],
    });

    myinfo = result.data.split("&");
    
      sug_pharmacy1[0]= myinfo[0];
      sug_pharmacy1[1]= myinfo[1];
      sug_pharmacy1[2]= myinfo[2];
    
    setState(() {});
  }
   show_pharmciesshift() async {
      var result = await http_get("fridayshift", {
      "id": widget.firstlist[0],
    });

    myinfo = result.data.split("&");
    
      shift= myinfo[0];
      // sug_pharmacy1[1]= myinfo[1];
      // sug_pharmacy1[2]= myinfo[2];
    
    setState(() {});
  }
  //debugPrint("");
 void initState() {
   DateTime date = DateTime.now();

     create_notification("12:37",date.weekday);
     show_pharmciesinfo();
      show_pharmciesshift();
    super.initState();
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    


    
      return Scaffold(
         backgroundColor:Color(0xFF91c4aa),
        //ChatDetailPage
        bottomNavigationBar: CurvedNavigationBar(
           backgroundColor:Color(0xFF91c4aa),
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30 ),
           
                                      IconButton(
                      icon: Icon( Icons.search, size: 30,),
                   onPressed: (){  
Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => search_2_screen(
                  firstlist: [widget.firstlist[2]],
                )));
    },
      
    ),

                             IconButton(
                      icon: Icon( Icons.chat, size: 30,),
                   onPressed: (){  
Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ChatDetailPage(
                  firstlist: [widget.firstlist[2]],
                )));
    },
      
    ),
    
          
                                      IconButton(
                      icon: Icon( Icons.access_alarms_sharp , size: 30,),
                   onPressed: (){  
          
Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => AddNewMedicine(
                 
                )));
    },
      
    ),
                                  IconButton(
                      icon: Icon( Icons.settings, size: 30,),
                   onPressed: (){  
          
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
                    color: Color.fromARGB(255, 195, 238, 222),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 20.0),
                    ],
                  ),
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.4),
                  child: ad_slides(context)
                  ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            //   child: Text(
            //     'Pharmacy on the friday shift:',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w600,
            //       fontSize: MediaQuery.of(context).size.width * 0.045,
            //       letterSpacing: 0.5,
            //       color: Color.fromARGB(255, 19, 33, 55),
            //     ),
            //   ),
              
            // ),
            
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
             Padding(
              padding: 
                 EdgeInsets.only(
                  bottom:(MediaQuery.of(context).size.width * 0.00),
                top:(MediaQuery.of(context).size.width * 0.02),
                            right: (MediaQuery.of(context).size.width * 0.02),
                           left: (MediaQuery.of(context).size.width * 0.02),),
              
              
              //EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Container(
                height: 200.0,
                width: 100,
                alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 195, 238, 222),
    
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 40.0),
                    ],
                  ),
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.04),
                  child:  Text(
                 'Pharmacy on the friday shift: ',
                
               
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
                  ),
            ),
             Padding(
              padding: 
              EdgeInsets.only(
                top:(MediaQuery.of(context).size.width * 0.0),
                            right: (MediaQuery.of(context).size.width * 0.02),
                           left: (MediaQuery.of(context).size.width * 0.02),),
              
              //EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Container(
                alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 195, 238, 222),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 20.0),
                    ],
                  ),
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.04),
                  child:  Text(
               shift,
               
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
              ),
                  ),
            ),
              //    Container(
              //       padding: EdgeInsets.only(
              //           left: MediaQuery.of(context).size.width * 0.05,
              //           top: MediaQuery.of(context).size.width * 0.05),
              // //              child: Text(
              // //  shift,
              // //   style: TextStyle(
              // //     fontWeight: FontWeight.w600,
              // //     fontSize: MediaQuery.of(context).size.width * 0.045,
              // //     letterSpacing: 0.5,
              // //     color: Color.fromARGB(255, 19, 33, 55),
              // //   ),
              // // ),
              //       // child: Text(
              //       //   "No Meals yet",
              //       //   style: TextStyle(
              //       //       color: Color.fromARGB(255, 136, 60, 89),
              //       //       fontSize: 30,//size.width * 0.05,
              //       //       fontWeight: FontWeight.w600),
              //       // ),
              //     ),
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
                    //  for (int ii = 0; ii < 3; ii++)
                        for (int i in ind) add_sug_pharmacy(context, size , i,j),
                          
                         

                          
                        
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

                   
             
            ),
               
          
           ],
        ),
      ),





   
      
        
        
        
        
        );
        
  }}
 
 
  Widget add_sug_pharmacy(BuildContext context, Size size, int i,int j) {
    
    return   InkWell(
        onTap: () {
                    // callpage(i,context);
          //showAlertDialog(context, sug[i]);
        },
      
           

        child: Padding(
            padding: EdgeInsets.only(left: size.height * 0.03),
            child: Column(
             // child: Row(
         children: <Widget>[
              //children: [
                
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

              child:Padding(
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
                            sug_pharmacy1[i],
                            
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 8, 73, 46),
                                fontSize: size.width * 0.044,
                                fontWeight: FontWeight.w600),

                          ),
                           Container(
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                                 child:  IconButton(
                      icon: Icon( Icons.arrow_right, size: 40,),
                   onPressed: (){  
     
Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ListViewPage(
                  name: sug_pharmacy1[i],
                  
                )));
    },
      
    ),),

                          
                        ],
                          
                      )
                       ),
                ),
                    
              ],
            
            )));
            
  }
 Widget ad_slides(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      initialPage: 0,
      indicatorColor: Color(0xff132137),
      indicatorBackgroundColor: Colors.grey,
      children: [
        for (int ii = 0; ii <images.length ; ii++)
          for (int i in ind) Image.asset(images[ii]),
      ],
      onPageChanged: (value) {},
      autoPlayInterval: 1000,
      isLoop: true,
    );
  }
  


  