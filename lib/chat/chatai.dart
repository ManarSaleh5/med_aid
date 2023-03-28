import 'package:bubble/bubble.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:flutter/material.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
import 'package:dialogflow_flutter/message.dart';

class ChatDetailPage  extends StatefulWidget {
 @override
   List firstlist;
  ChatDetailPage({Key? key, required this.firstlist}) : super(key: key);
  _ChatDetailPageState createState() => _ChatDetailPageState();
}
    
class _ChatDetailPageState extends State<ChatDetailPage> {
 
 //List<Map<String, dynamic>> messsages = [];
  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson:"assets/med-aid-chatai-fqlv-fbba9e2defea.json")
            .build();
    DialogFlow dialogflow = DialogFlow(authGoogle: authGoogle, language: "en");
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    
   
     if (aiResponse == null) return;
     else{
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      
      });
    
    });
    }
    
  }
  final messageInsert = TextEditingController();
   // ignore: prefer_collection_literals, deprecated_member_use
   List<dynamic> messsages=[];
   //List<Map<String, dynamic>> messsages= [] ;
//List< String> messsages=List();
// ignore: prefer_collection_literals, deprecated_member_use, unnecessary_new



//List< String> messsages=List as List<String>;
  // List<Map<String, dynamic>> list = [];
  //final List<ChatMessage> _messages = <ChatMessage>[];
  //  List<Map<String, dynamic>> messsages = [];//..length = 500;
  //List<Map> messsages = [];//..length = 500;
 //List< String> messsages=List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        elevation: 10,
        title: Text("pharmacy Chatbot"),
        backgroundColor:  Color(0xFF91c4aa),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            Divider(
              height: 6.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    controller: messageInsert,
                    decoration: InputDecoration.collapsed(
                        hintText: "Send your message",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      
                        icon: Icon(
                          
                          Icons.send,
                          size: 30.0,
                          color: Color.fromARGB(255, 47, 97, 64),
                        ),
                        onPressed: () {
                          if (messageInsert.text.isEmpty) {
                            print("empty message");
                          } else {
                            setState(() {
                              messsages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                            });
                           
                            response(messageInsert.text);
                            messageInsert.clear();
                          }
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Color.fromARGB(255, 36, 95, 76) : Color(0xFF91c4aa),
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(
                      data == 0 ? "assets/images/bot.png" : "assets/images/user.png"),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,fontSize:18),
                ))
              ],
            ),
          )),
    );
  }
}
