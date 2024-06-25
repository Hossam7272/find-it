import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LostCard extends StatelessWidget {
  String location;
  String date;
  String Details;
  String img;
  LostCard(
      {super.key,
      required this.date,
      required this.location,
      required this.Details,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            child: FancyShimmerImage(
              imageUrl: img,
              height: 100.h,
            ),
          ),
          Text(
            'location: $location',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            'name: $Details',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            'date $date',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
