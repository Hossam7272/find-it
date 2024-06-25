// import 'package:find_it/core/theming/app_color.dart';
// import 'package:find_it/features/chatting/ui/screens/chat_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.GreenDC,
//       appBar: AppBar(
//         backgroundColor: AppColors.myGreen,
//         title: Text('messages'.tr,style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: 4,
//           itemBuilder: (_,i){
//               return GestureDetector(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatDetailsScreen()));
//                 },
//                 child: const ListTile(
//                   title: Text('Chat 1'),
//                   leading: CircleAvatar(radius: 39,backgroundColor: Colors.blue,),
//                   subtitle: Text('hello my friend'),
//                   trailing: Text('11:30'),
//                 ),
//               ) ;
//           }
//       ),
//     );
//   }
// }
