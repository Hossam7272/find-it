// import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:find_it/core/theming/app_color.dart';
// import 'package:find_it/core/widgets/myform.dart';
// import 'package:find_it/features/chatting/chating.dart';
// import 'package:find_it/features/chatting/data/chat_model.dart';
// import 'package:find_it/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
//
// class ChatDetailsScreen extends StatefulWidget {
//   const ChatDetailsScreen({super.key});
//
//   @override
//   State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
// }
//
// class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
//   final _firestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController controller = TextEditingController();
//     return Scaffold(
//       backgroundColor: AppColors.GreenDC,
//       appBar: AppBar(
//         backgroundColor: AppColors.myGreen,
//         centerTitle: true,
//         title: const Text('Chat 1'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: chatMessages.length,
//                 itemBuilder: (_,index){
//                   return BubbleSpecialThree(
//                     text: chatMessages[index].text,
//                     color: AppColors.myGreen,
//                     tail: true,
//                     textStyle: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 16
//                     ),
//                   );
//                 }),
//           ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.w),
//               child: Row(
//                 children: [
//                   Expanded(child: MyForm(txt: 'message'.tr, controller: controller,)),
//                   SizedBox(width: 10.w,),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 12.h),
//                     child: CircleAvatar(
//                       radius: 25.r,
//                       backgroundColor: AppColors.myGreen,
//                       child: IconButton(onPressed: ()async{
//                         await _firestore.collection('messages').add({
//                           'text'        : controller.text,
//                           'senderId'    : savey.getString('id'),
//                           'receiverId'  :
//                         });
//                         controller.clear();
//                         setState(() {});
//                       }, icon: const Icon(Icons.send,color: Colors.black,)),
//                     ),
//                   )
//                 ],
//               ),
//             )
//         ],
//       ),
//
//     );
//   }
// }
