import '../constants.dart';

import '../widgets/custom_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FB_DARK_PRIMARY,
      width: ScreenUtil().screenWidth,
      child: ListView(
        children: [
          CustomInfo(
          name: 'benrichards',
          description: 'posted a new photo.',
          hasSubDescription: true,
          hasAvatar: false,
          subDescription: 'lakad matatag hahahahhaah',
          date: '43m',
          hasImage: true,
          image: 'assets/images/screenshot.png',
          numOfLikes: 67,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          avatar: 'assets/images/avatar1.png',
          name: 'Memester',
          description: 'posted a new photo.',
          hasSubDescription: true,
          hasAvatar: true,
          subDescription: 'didn\'t know goofy was this tuff 🥶',
          date: '12h',
          hasImage: true,
          image: 'assets/images/goofy.png',
          numOfLikes: 911,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          avatar: 'assets/images/avatar4.png',
          name: 'QueenBee',
          description: 'posted a new photo.',
          hasSubDescription: true,
          hasAvatar: true,
          subDescription: 'Loving the new vibes! #freshstart',
          date: '13h',
          hasImage: true,
          image: 'assets/images/line.png',
          numOfLikes: 320,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          avatar: 'assets/images/avatar3.png',
          name: 'JackBowe',
          description: 'posted a new photo.',
          hasSubDescription: true,
          hasAvatar: true,
          subDescription: 'I just bought my first NFT!',
          hasImage: true,
          date: '1d',
          image: 'assets/images/avatar3.png',
          numOfLikes: 45,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          name: 'Stamford',
          description: 'posted a new status.',
          hasSubDescription: true,
          subDescription: 'I might be the richest man alive!',
          hasAvatar: false,
          date: '1d',
          hasImage: false,
          numOfLikes: 1,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          name: 'Misthios',
          description: 'posted a new status.',
          hasSubDescription: true,
          subDescription: 'I love my job!',
          hasAvatar: false,
          date: '1d',
          hasImage: false,
          numOfLikes: 2,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          avatar: 'assets/images/avatar5.png',
          name: 'xX_DarkKnight_Xx',
          description: 'posted a new status.',
          hasSubDescription: true,
          hasAvatar: true,
          subDescription: 'i am the dark knight.',
          date: '2d',
          hasImage: false,
          numOfLikes: 80,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          avatar: 'assets/images/avatar6.png',
          name: 'DaBaby',
          description: 'posted a new photo.',
          hasSubDescription: true,
          subDescription: 'son',
          hasAvatar: true,
          date: '1w',
          hasImage: true,
          image: 'assets/images/son.png',
          numOfLikes: 50,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          avatar: 'assets/images/avatar7.png',
          name: 'bronnyjames',
          description: 'posted a new photo.',
          hasSubDescription: true,
          subDescription: 'you are my sunshine...',
          hasAvatar: true,
          date: '2w',
          hasImage: true,
          image: 'assets/images/avatar7.png',
          numOfLikes: 23,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
        CustomInfo(
          avatar: 'assets/images/avatar8.png',
          name: 'Perrell Laquarius Brown',
          description: 'posted a new photo.',
          hasSubDescription: true,
          hasAvatar: true,
          subDescription: 'It\'s nice to see you again my king!',
          date: '2w',
          hasImage: true,
          image: 'assets/images/two_friends.png',
          numOfLikes: 69,
        ),
        Divider(color: FB_LIGHT_PRIMARY),
      ],
      )
    );
  }
}
