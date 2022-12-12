import 'package:flutter/material.dart';
import 'package:gp1_med_aid/settings/setting%20.dart';
import 'package:gp1_med_aid/chat/chatai.dart';
import'package:gp1_med_aid/pharmacy/pages.dart';
import '../http.dart';

class ListViewPage extends StatefulWidget {
  @override
  String name=" ";

 ListViewPage({Key? key, required this.name}) : super(key: key);
  _ListViewPageState createState() => _ListViewPageState();

}

  var titleList = [
    "vitamins",
    "children",
    "blood_pressure",
    "Gluten_free_foods",
    "sanitary",
    "analgesics",
    "skin_care",
    "others"
  ];

  // Description List Here
  var descList = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " "
    // "Push yourself, because no one else is going to do it for you.",
    // "Your limitation—it's only your imagination.",
    // "Hard Work changes the life.",
    // "Sometimes it's the smallest decisions that can change your life forever.",
    // "Confidence is the most beautiful thing you can possess",
    // "A big business starts small.",
    // "Talent wins games, but teamwork and intelligence win championships.",
    // "Talent wins games, but teamwork and intelligence win championships."
  ];
  String id2=" ";
List<String> myinfo = [];
  // Image Name List Here
  var imgList = [
    "assets/images/vitmins.png",
    "assets/images/children.png",
    "assets/images/bloodp.png",
     "assets/images/gluten.png",
     "assets/images/santize.png",
     "assets/images/anl.png",
     "assets/images/skinc.png",
     "assets/images/othr.png"

  ];
class _ListViewPageState extends State<ListViewPage> {
  // Title List Here
//   pharmcyidd() async {
// var result = await http_get("pharmcyid'", {
      
//       "name":widget.name,
     
      
    
    
//     });
//     id2=result.data;
//     print(result.data);
//       if (result.data=="iiii") {
//              print("io");

// }
// else{    
//   print(result.data);
             
// }

 
//  }
 show_pharmciesid() async {
      var result = await http_get("pharmcyid", {
      "name": widget.name,
    });

    id2 = result.data;
    setState(() {});
  }
  void initState() {
show_pharmciesid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.name);
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
          "Pharmacy categories ",
          style: TextStyle(color: Color.fromARGB(255, 23, 51, 26)),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF91c4aa),
      ),
      // Main List View With Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
    
        
            
                 
          
            
              // This Will Call When User Click On ListView Item
              //showDialogFunc(context, imgList[index], titleList[index], descList[index]);
              //showDialogFunc(context);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                
                children: <Widget>[
          
                  Container(
                    width: 100,
                    height: 100,
              
          
                    child: Image.asset(imgList[index]),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                   
                  Container(
                  height: size.height * 0.07,
                  width: size.width * 0.09,
                                 child:  IconButton(
                      icon: Icon( Icons.arrow_forward, size: 30,),
                   onPressed: (){  
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Page_n(
                             name :

                                  
                                  widget.name,

                                  categories: titleList[index],
                                  id:id2,
                              
                                 
                              )));
 
    },
      
    ),),

                      ],
                    ),
         
                  )
              
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog 
showDialogFunc(context) {
  
      Navigator.push(
        context,
        MaterialPageRoute(
            // builder: (_) => profile(

            //       firstlist: [id],
            //     )
             builder: (_) => setting_screen(firstlist: [],)
             
                ));

   
 
  //return showDialog(
   // context: context,
    // builder: (context) {
    //   return Center(
    //     child: Material(
    //       type: MaterialType.transparency,
    //       child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: Colors.white
    //         ),
    //         padding: EdgeInsets.all(15),
    //         height: 320,
    //         width: MediaQuery.of(context).size.width * 0.7,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(5),
    //               child: Image.asset(
    //                 img,
    //                 width: 200,
    //                 height: 200,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 10,
    //             ),
    //             Text(
    //               title,
    //               style: TextStyle(
    //                 fontSize: 25,
    //                 color: Colors.grey,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 10,
    //             ),
    //             Container(
    //               // width: 200,
    //               child: Align(
    //                 alignment: Alignment.center,
    //                 child: Text(
    //                   desc,
    //                   maxLines: 3,
    //                   style: TextStyle(fontSize: 15, color: Colors.grey[500]),
    //                   textAlign: TextAlign.center,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // },
 // );
}