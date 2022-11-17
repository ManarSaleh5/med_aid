// import 'package:flutter/material.dart';

// class ChatMessage extends  StatefulWidget {
  
//   List firstlist;
    
//   ChatMessage({Key? key, required this.firstlist}) : super(key: key);
//   _ChatMessageState createState() => _ChatMessageState();
  
//  }
//   // ignore: avoid_positional_boolean_parameters
//  final Map<String, dynamic> data;
//   final bool mine;
// class _ChatMessageState extends State< ChatMessage> {
   
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//       child: Row(
//         children: <Widget>[
//           !mine ?
//           Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(data['senderPhotoUrl']),
//             ),
//           ) : Container(),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: mine 
//                 ? CrossAxisAlignment.end 
//                 : CrossAxisAlignment.start,
//               children: <Widget>[
//                 data['imgUrl'] != null 
//                   ? Image.network(data['imgUrl'], width: 250)
//                   : Text(
//                     data['text'],
//                     textAlign: mine 
//                     ? TextAlign.end 
//                     : TextAlign.start,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   Text(
//                     data['senderName'],
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           mine ?
//           Padding(
//             padding: const EdgeInsets.only(left: 16),
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(data['senderPhotoUrl']),
//             ),
//           ) : Container(),
//         ],
//       ),
//     );
//   }
// }