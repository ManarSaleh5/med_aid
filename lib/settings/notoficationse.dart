import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class notification_page extends StatefulWidget {
  List firstlist;
  notification_page({Key? key, required this.firstlist}) : super(key: key);
  @override
  _notification_pageState createState() => _notification_pageState();
}

class _notification_pageState extends State<notification_page> {
  @override


  initState() {
 
    super.initState();
  }

  String value = '';
  String value2 = '';
  List st = [
    ' medicine  reminders give you a visual reminder at exactly the right time when you should take it.',
    'Get ready reminders appear at the exact time to take your drugs.',
  ];
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        
        toolbarHeight: MediaQuery.of(context).size.height * 0.11,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 19, 33, 55),
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
        backgroundColor:  Color(0xFF91c4aa),
      ),
      body: Column(
        children: [
                Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.height * 0.015, vertical: size.height * 0.015),
            child: Container(
              padding: EdgeInsets.only(
                  left: size.height * 0.03,
                  right: size.height * 0.025,
                  top: size.height * 0.009,
                  bottom: size.height * 0.01),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
                  border: Border.all(
                    color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Color.fromARGB(255, 42, 94, 68),
                            size: MediaQuery.of(context).size.height * 0.05,
                          ),
                          onPressed: () {
                          
                          }),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.009),
                          child: Text(
                            'Notifiction information',
                            style: GoogleFonts.poppins(
                              //   color: Color.fromARGB(255, 71, 104, 158),
                              fontSize:25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 1,
                    
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.037,
                  ),
                 
                  SizedBox(
                    height: size.height * 0.037,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.037),
            child: Text(
              " Medicine  reminders give you a visual reminder at exactly the right time when you should take it.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color:Color.fromARGB(255, 42, 94, 68),
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.037),
            child: Text(
              " Get ready reminders appear at the exact time to take your drugs.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 42, 94, 68),
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.037,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.height * 0.015, vertical: size.height * 0.015),
            child: Container(
                padding: EdgeInsets.only(
                    left: size.height * 0.03,
                    right: size.height * 0.025,
                    top: size.height * 0.009,
                    bottom: size.height * 0.01),
                decoration: BoxDecoration(
                    color: Color(0xFF91c4aa).withOpacity(0.5),
                    border: Border.all(
                      color:
                          Color(0xFF91c4aa).withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
               ),
          ),
          SizedBox(
            height: size.height * 0.017,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: size.height * 0.015, vertical: size.height * 0.015),
          //   child: Container(
          //     padding: EdgeInsets.only(
          //         left: size.height * 0.03,
          //         right: size.height * 0.025,
          //         top: size.height * 0.009,
          //         bottom: size.height * 0.01),
          //     decoration: BoxDecoration(
          //         color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
          //         border: Border.all(
          //           color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
          //         ),
          //         borderRadius: BorderRadius.all(Radius.circular(30))),
          //     child: Column(
          //       children: [
          //         Row(
          //           children: [
          //             IconButton(
          //                 icon: Icon(
          //                   Icons.info,
          //                   color: Color.fromARGB(255, 19, 33, 55),
          //                   size: MediaQuery.of(context).size.height * 0.05,
          //                 ),
          //                 onPressed: () {
                          
          //                 }),
          //             SizedBox(
          //               width: MediaQuery.of(context).size.height * 0.02,
          //             ),
          //             Expanded(
          //               child: Padding(
          //                 padding: EdgeInsets.only(top: size.height * 0.009),
          //                 child: Text(
          //                   'Notifiction information',
          //                   style: GoogleFonts.poppins(
          //                     //   color: Color.fromARGB(255, 71, 104, 158),
          //                     fontSize: size.height * 0.028,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Transform.scale(
          //               scale: 1,
                    
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: size.height * 0.037,
          //         ),
                 
          //         SizedBox(
          //           height: size.height * 0.037,
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, String txt) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Notifiction information',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xff132137),
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      txt,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 34, 99, 204),
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 33, 53, 85),
                      radius: 30,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  
}
