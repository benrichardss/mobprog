import '../screens/detail_screen.dart';

import '../constants.dart';

import '../widgets/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({
    super.key,
    this.avatar = '',
    required this.name,
    required this.description,
    required this.hasSubDescription,
    required this.hasAvatar,
    required this.hasImage,
    this.numOfLikes = 0,
    this.subDescription = '',
    this.atProfile = false,
    this.date = '',
    this.image = '',
  });

  final String avatar, name, description, subDescription, date, image;
  final bool hasSubDescription, hasImage, hasAvatar, atProfile;
  
  final int numOfLikes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: InkWell(
        onTap: () {
          (atProfile)
              ? () {}
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      userName: name,
                      postContent: subDescription,
                      date: date,
                      avatar: avatar,
                      hasImage: hasImage,
                      image: image,
                      hasAvatar: hasAvatar,
                      numOfLikes: numOfLikes,
                    ),
                  ),
                );
        },
        child: Row(
          children: [
            (hasAvatar)
                ? CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(avatar),
                    backgroundColor: FB_LIGHT_PRIMARY,
                  )
                : CircleAvatar(
                    radius: 25,
                    backgroundColor: FB_LIGHT_PRIMARY,
                    child: Icon(
                      Icons.person,
                      size: ScreenUtil().setSp(50),
                      color: Colors.grey,
                    ),
                  ),

            SizedBox(width: ScreenUtil().setWidth(10)),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: name,
                    fontSize: ScreenUtil().setSp(20),
                    color: FB_TEXT_COLOR_WHITE,
                    fontWeight: FontWeight.w800,
                  ),
                  CustomFont(
                    text: description,
                    fontSize: ScreenUtil().setSp(13),
                    color: FB_TEXT_COLOR_WHITE,
                  ),
                  hasSubDescription
                      ? CustomFont(
                          text: '"$subDescription"',
                          fontSize: ScreenUtil().setSp(13),
                          color: FB_TEXT_COLOR_WHITE,
                        )
                      : SizedBox(height: ScreenUtil().setHeight(0)),
                ],
              ),
            ),
            const Spacer(),
            Icon(Icons.more_horiz, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class CustomInfoModified extends CustomInfo {
  const CustomInfoModified({
    super.key,
    super.avatar,
    required super.name,
    required super.description,
    required super.hasSubDescription,
    required super.hasAvatar,
    required this.changeLeading,
    required this.nullifyTrailing,
    required super.hasImage,
    super.numOfLikes,
    this.iconLeading,
    super.subDescription,
    super.atProfile,
    super.date,
    super.image,
  });

  final bool changeLeading, nullifyTrailing;
  final IconData? iconLeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Row(
        children: [
          (hasAvatar)
            ? CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(avatar),
                backgroundColor: FB_LIGHT_PRIMARY,
              )
            : CircleAvatar(
                radius: 25,
                backgroundColor: FB_LIGHT_PRIMARY,
                child: Icon(iconLeading, color: Colors.grey)
              ),
          SizedBox(width: ScreenUtil().setWidth(10)),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFont(
                  text: name,
                  fontSize: ScreenUtil().setSp(20),
                  color: FB_TEXT_COLOR_WHITE,
                  fontWeight: FontWeight.w800,
                ),
                CustomFont(
                  text: description,
                  fontSize: ScreenUtil().setSp(13),
                  color: FB_TEXT_COLOR_WHITE,
                ),
                hasSubDescription
                    ? CustomFont(
                        text: subDescription,
                        fontSize: ScreenUtil().setSp(13),
                        color: FB_TEXT_COLOR_WHITE,
                      )
                    : SizedBox(height: ScreenUtil().setHeight(0)),
              ],
            ),
          ),
          const Spacer(),
          Icon(nullifyTrailing ? null : Icons.more_horiz, color: Colors.grey),
        ],
      ),
    );
  }
}
