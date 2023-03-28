import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp1_med_aid/reminder/timers.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';


//import 'package:medicine/notifications/notifications.dart';



import '../http.dart';
List<String> myinfo = [];
var order_list=[];
//List<String> myinfo1 = [];
String myinfo1 = " ";
String price_drug=" ";
var priceorder_list=[];
String drug_name="";
String drug_name1="";
String drug_price="";
String num="";
String status1="";
class order_page extends StatefulWidget {
  @override
  String name=" ";
    String uid="";
    String pid="";
    
   order_page({Key? key, required this.name,required this.uid,required this.pid}) : super(key: key);
  _order_pageState createState() => _order_pageState();
}

class _order_pageState extends State<order_page> {
final _scaffoldKey = GlobalKey<ScaffoldState>();
 order() async {
      var result = await http_get("get_order", {
      "id": widget.uid,
      "pid":widget.pid,
    });
    if(result.data.toString()!="not found"){

 
    myinfo = result.data.split("&");
     for(int i=0;i<myinfo.length;i++)
     if(myinfo[i]!="")
      order_list.add(myinfo[i]);
     print(myinfo);
    setState(() {});
  }

  
  }
   priceorder() async {
     
      var result = await http_get("get_priceorder", {
      
        "id": widget.uid,
        "pid":widget.pid,
        "pname":drug_name,
    });
    if(result.data.toString()!="not found"){

 
    myinfo1 = result.data;
   price_drug=myinfo1;
      //priceorder_list.add(myinfo1[i]);}
     print(myinfo1);
    setState(() {});
  }}
   dorder() async {
order_list=[];
    var result = await http_get("delete_order", {
        "id": widget.uid,
      "pid":widget.pid,
      "dname":drug_name,
      
    });

      num=result.data;
    //setState(() {});
  }
  statusorder() async {
    
status1=" ";
    var result = await http_get("status_order", {
        "id": widget.uid,
      "pid":widget.pid,
      "dname":drug_name1,
      
    });

      status1=result.data;
    //setState(() {});
  }
  
  void initState() {
 order();
order_list=[];
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
           body:SingleChildScrollView( child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.01,
                            right: size.width * 0.02,
                            left: size.width * 0.02),
                        child: Text(
                            'You\'ve order these Items',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.055,
                              color: Color.fromARGB(255, 19, 33, 55),
                            )),
                     
    
                      ),
//                                                      IconButton(
//                       icon: Icon( Icons.done, size: 40,),                                                                                   
//                    onPressed: (){  
//                   drug_price="";
//                   drug_name=order_list[i];
//              //drug_price=order_list[i];
//               //print(drug_name);
//               priceorder();
//  print(price_drug);
//     },
      
//     ),
                      for (int ii = 0; ii < order_list.length; ii++)
                         show_order(context, size, ii),
                      
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.width * 0.03,
                        ),
                      ),
                    ],
                  ),),
      
      );
  }
  Widget show_order(BuildContext context, Size size, int i) {
    
    return   InkWell(
        onTap: () {
        },
      
           

        child: Padding(
            padding: EdgeInsets.only(left: size.height * 0.03),
            child: Column(
             
         children: <Widget>[
              //children: [
                Container(
  height:20,
),
                Container(
                  
            
       
                  width: size.width * 0.4,
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
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
                            child:Image.asset("assets/images/order1.gif"),
                            

                            ),
  

                          ),

                         
                          Text(
                            order_list[i],
                            
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
                      icon: Icon( Icons.cancel_outlined, size: 40,),                                                                                   
                   onPressed: ()async{  
                   drug_name1=order_list[i]; 
                   await statusorder();
                   print(status1);
                  drug_name=order_list[i];
                  if(status1=="pending"){
                 await dorder();
                 if(true){
                 await order();}
                 }
                 else{
                  showProcess(context,status1,i);
                 }
                 
            
             

    },
      
    ),),
                  Container(
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                                 child:  IconButton(
                      icon: Icon( Icons.question_mark_outlined, size: 40,),                                                                                   
                   onPressed: () async { 
                    drug_name1=order_list[i]; 
                   await statusorder();
                   showDialogFunc(context,status1,i);
    },
      
    ),),
      
   

                          
                        ],
                          
                      )
                       ),
                ),
                    
              ],
            
            )));
            
  }
  
   showDialogFunc(context,title,int i) {
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
            height: 200,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                    Container(
                  color: Color(0xFF91c4aa),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      order_list[i],
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
                "order status: " ,
                  style: TextStyle(
                    fontSize: 24,
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
                    fontSize: 22,
                    color: Color.fromARGB(255, 41, 87, 75),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      );
    },
  );
}
 showProcess(context,title,int i) {
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
            height: 200,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                    Container(
                  color: Color(0xFF91c4aa),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      order_list[i],
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
                "your order is approved,you can't delete it " ,
                  style: TextStyle(
                    fontSize: 20,
                    color:Color(0xFF81142F),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                 SizedBox(
                  height: 10,
                ),
                Text(
                "order status: " ,
                  style: TextStyle(
                    fontSize: 24,
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
                    fontSize: 22,
                    color: Color.fromARGB(255, 41, 87, 75),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      );
    },
  );
}
  
  
  }