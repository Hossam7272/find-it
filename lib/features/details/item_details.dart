import 'package:find_it/core/widgets/mybtn.dart';
import 'package:find_it/features/auth/signup/widgets/email&phone_validation.dart';
import 'package:find_it/features/details/item_controller.dart';
import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/networking/api_const.dart';
import '../../core/theming/my_styles.dart';

class ItemDetails extends StatefulWidget {
  var item;

  ItemDetails({super.key,required this.item});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  ItemController controller = Get.put(ItemController());
  @override
  void initState(){
    super.initState();
    controller.getUserById('${widget.item.userId}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF6F5F5),
          title: const Text(
            'Item Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xffF6F5F5),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Container(
                      width: 250,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xFFD9D9D9)),
                      child: Image.network(
                        '${ApiConst.imageFolder}/${widget.item.img}',
                        fit: BoxFit.fill,
                        height: 100.h,
                      ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/location.png'),
                  const SizedBox(width: 10),
                  Text(
                    '${widget.item.location}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/call.png'),
                  const SizedBox(width: 10),
                 GetBuilder<ItemController>(
                     builder: (controller){
                       return  Text(
                         '${controller.user?.phone}',
                         style: const TextStyle(fontWeight: FontWeight.bold),
                       );
                     }
                 )
                ],
              ),
              const SizedBox(height: 22),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Image.asset('assets/img/calendar.png'),
                        const SizedBox(width:10),
                        const Text(
                          'Date of Upload: ',
                        ),
                      ],
                    ),
                    Text('${widget.item.date}'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Image.asset('assets/img/calendar.png'),
                        const SizedBox(width:10),
                        const Text(
                          'Time of Upload: ',
                        ),
                      ],
                    ),
                    Text('${widget.item.time}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Image.asset('assets/img/calendar.png'),
                        const SizedBox(width:10),
                        const Text(
                          'Date of Lost: ',
                        ),
                      ],
                    ),
                    Text('${widget.item.timeOfLost}'),
                  ],
                ),
              ),

              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/img/document.png'),
                    const SizedBox(width: 10),
                    const Text('Details'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 144,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 11,
                        spreadRadius: 3,
                        color: Colors.grey.withOpacity(.4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                    ),
                    maxLines: 55,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: MyBtn(
                  onTap: (){
                    controller.sendWhatsAppMessage(phone: '${controller.user?.phone}', message: 'من فضلك انا صاحب هذا و اريده منك', context: context);
                  },
                  myChild: Text("Send What's App",style: MyStyles.font18w500,),


                )
              ),
            ],
          ),
        ));
  }
}
