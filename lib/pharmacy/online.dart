import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp1_med_aid/reminder/timers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp1_med_aid/pharmacy/order.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';


//import 'package:medicine/notifications/notifications.dart';



import '../http.dart';


  
String myinfo1="";
String price="";
String type="";
String dname="";
List<String> myinfo = [];
var online_list=[];
 String des="";
 
class online_shop extends StatefulWidget {
  @override
  String name=" ";
    String id;
    String uid;
   online_shop({Key? key, required this.name,required this.id,required this.uid}) : super(key: key);
  _online_shopState createState() => _online_shopState();
}

class _online_shopState extends State<online_shop> {
 
  show_description() async {
      myinfo1=" ";
      var result = await http_get("showdescription", {
      "name": des,
      
    });
    setState(() {
      myinfo1 = result.data;
      print(myinfo1);

    });
  }
     show_price() async {
      price=" ";
      var result = await http_get("showprice", {
      "name": des,
      
    });
    setState(() {
      price= result.data;
      print(price);

    });
  }
  show_type() async {
      type=" ";
      var result = await http_get("showtype", {
      "name": des,
      
    });
    setState(() {
      type= result.data;
      print(type);

    });
  }

 // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
  

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  show_online() async {
      var result = await http_get("showonlinedrugs", {
      "id": widget.id,
    });
    if(result.data.toString()!="not found"){

 
    myinfo = result.data.split("&");
   
    print(myinfo);
    
    setState(() {
       for(int i=0;i<myinfo.length;i++)
       if(myinfo[i]!="")
        online_list.add(myinfo[i]);
    
    });
  }}
  createorder() async {
var result = await http_post("create-order", {
      "user_id":widget.uid,
      "pharmacy_id":widget.id,
      "drug_name":dname,
      "price":price,
    
    
    });
      if (result.ok) {
var response = result.data['status'];}
 print(result.data['status'].toString());
 }
 void initState() {
show_online() ;
online_list=[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.uid);
      Size size = MediaQuery.of(context).size;
    final deviceHeight = MediaQuery.of(context).size.height - 60.0;
final focus = FocusScope.of(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF91c4aa),
       appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.height * 0.10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 32, 88, 65),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
       title: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Image.asset(
              'assets/images/logoo1-removebg-preview.png',
              fit: BoxFit.cover,
            ),

            //
          ),
        ),
          actions: [
         
          ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Container(
                // padding: EdgeInsets.only(left: 15.0),
                // height: deviceHeight * 0.05,
               // child: FittedBox(
                    child: Text(
                  "these items are available for online purchase with payment on delivery ",
                  textAlign: TextAlign.center,
                   style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.055,
                              color: Color.fromARGB(255, 35, 88, 68),
                            )
                  //  style: TextStyle(
                  //       color: Color.fromARGB(255, 35, 88, 68),
                  //       fontSize: 25,
                  //       //fontWeight: FontWeight.w500
                  //       ),
                 
                   //   .copyWith(color: Colors.black),
                )
                //),
              ),
  

                Container(
                  height: 10,
                ),
               
             SizedBox(
              height: 20,
          ),
       Container(
                  height:MediaQuery.of(context).size.height*0.5,
                  child: ListView.builder(
        
        itemCount: online_list.length,
        itemBuilder: (context, index) {
         
           

          return GestureDetector(
            onTap: () async {

                 des=online_list[index];
                await show_description();
                      await show_price() ;
                      await show_type();
              // This Will Call When User Click On ListView Item
              showDialogFunc(context, Image.asset("assets/images/drugg.png"),myinfo1,index,price,type);
             //des=drug_list[index];
              
              // This Will Call When User Click On ListView Item
              //showDialogFunc(context, Image.asset("assets/images/drugg.png"),myinfo1,index,price,type);
              
              //showDialogFunc(context);
            },
        
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                
                children: <Widget>[
          
                  Container(
                    width: 100,
                    height: 100,
                        child:  Image.asset("assets/images/online.png"),
                      ),
                  

                 
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                         online_list[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
    

                      ],
                    ),
         
                  )
              
                ],
              ),
            ),
          );
        },
                  
      ),
                ),
                 Container(
                  height: 10,
                  
                ),
                 Container(
                  height: 10,
                  
                ),
                 Container(
                  height: 30,
                child: Row(
                  children: [
                  Text(
                    "see your orders",
                    //textAlign: TextAlign.center,
                   
                    style: TextStyle(
                      
                        color:  Color.fromARGB(255, 38, 83, 70),
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0),
                  ),
                                   IconButton(
                      icon: Icon( Icons.arrow_circle_right_outlined, size: 35,color:Color.fromARGB(255, 38, 83, 70) ,),
                   onPressed: (){  
Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>order_page(
                 name:"",
                 uid:widget.uid,
                 pid:widget.id,
                )));
    },
      
    ),
                  ],
                ),
                 ),
                
              // SizedBox(
              //   height: deviceHeight * 0.03,
              // ),
       
             
            //    Column(
            //   children: [
            //     SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Row(
            //         children: <Widget>[
            //         //  for (int ii = 0; ii < 3; ii++)
            //             for (int i=0;i<5;i++) add_type(context, size , i),
            //           Padding(
            //               padding: EdgeInsets.all(
            //                   MediaQuery.of(context).size.width * 0.01))
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
              // SizedBox(
              //   height: deviceHeight * 0.02,
              // ),
              Container(
                height: 10,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    
                  ],
                ),
              ),
              // SizedBox(
              //   height: deviceHeight * 0.03,
              // ),
           
              Spacer(),
             

            ],
          ),
        ),
      ),
      
    );
    
  }

   showDialogFunc(context, img, title,int i,p,t) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 400,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(5),
                //   child: Image.asset(
                //     img,
                //     width: 200,
                //     height: 200,
                //   ),
                // ),
                    Container(
                  // width: 200,
                  color: Color(0xFF91c4aa),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      online_list[i],
                      maxLines: 3,
                      style: TextStyle(fontSize: 25, color:  Color.fromARGB(255, 23, 51, 26)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                "description: " ,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 153, 108, 41),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                   Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 41, 87, 75),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                   Text(
                "price: " ,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 153, 108, 41),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                    Text(
                  p,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 41, 87, 75),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                "medicine form: " ,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 153, 108, 41),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                    Text(
                  t,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 41, 87, 75),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
               Container(

             
                    child: TextButton(
                       style: TextButton.styleFrom(
                        backgroundColor:Color(0xFF91c4aa),
                     
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(7.0),
                    textStyle: const TextStyle(fontSize: 20),
                       shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(17.0),
    ),
                  ),
                      onPressed: () async {
                        dname=online_list[i];
                        createorder();
                    
                      },
                      child: Text(
                        'Buy',
                        style: GoogleFonts.satisfy(
                            color:  Color.fromARGB(255, 25, 59, 42),
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                ),
               




                // Container(
                //   // width: 200,
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       desc,
                //       maxLines: 3,
                //       style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  
  
  
  }
  