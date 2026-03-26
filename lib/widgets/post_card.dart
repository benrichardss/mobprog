import 'package:bautista_mobprog/widgets/custom_inkwell_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_font.dart';
import '../screens/detail_screen.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final String avatar, image;
  final int numOfLikes, numOfComments, numOfShares;
  final bool hasImage, hasAvatar, isAds;
  final String adsMarket;
  const PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.avatar = '',
    required this.hasImage,
    required this.hasAvatar,
    this.image = '',
    this.numOfLikes = 0,
    this.numOfComments = 0,
    this.numOfShares = 0,
    this.adsMarket = '',
    this.isAds = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              userName: userName,
              postContent: postContent,
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
      child: Card(
        color: FB_LIGHT_PRIMARY,
        margin: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (hasAvatar)
                      ? CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(avatar),
                        )
                      : CircleAvatar(
                          radius: 18,
                          backgroundColor: FB_DARK_PRIMARY,
                          child: Icon(
                            Icons.person,
                            size: ScreenUtil().setSp(36),
                            color: Colors.grey,
                          ),
                        ),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        text: userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: FB_TEXT_COLOR_WHITE,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomFont(
                            text: date,
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.grey,
                          ),
                          SizedBox(width: ScreenUtil().setWidth(3)),
                          Icon(
                            Icons.public,
                            color: Colors.grey,
                            size: ScreenUtil().setSp(12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),

              SizedBox(height: ScreenUtil().setHeight(10)),

              CustomFont(
                text: postContent,
                fontSize: ScreenUtil().setSp(12),
                color: FB_TEXT_COLOR_WHITE,
              ),

              SizedBox(height: ScreenUtil().setHeight(5)),

              hasImage
                  ? ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: double.infinity,
                        maxHeight: isAds
                          ? ScreenUtil().setHeight(146)
                          : ScreenUtil().setHeight(350),
                      ),
                      child: Image.asset(image, fit: BoxFit.cover),
                    )
                  : SizedBox(height: ScreenUtil().setHeight(1)),

              SizedBox(height: ScreenUtil().setHeight(5)),

              (adsMarket != '')
                ? const SizedBox()
                : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up,
                        size: ScreenUtil().setSp(12),
                        color: Colors.grey,
                      ),
                      SizedBox(width: ScreenUtil().setWidth(4)),
                      CustomFont(
                        text: numOfLikes.toString(),
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      CustomFont(
                        text: ' $numOfComments Comments',
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey,
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      CustomFont(
                        text: '$numOfShares Shares',
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),

              (adsMarket != '') ?
              const SizedBox()
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      print('Liked');
                    },
                    icon: const Icon(Icons.thumb_up, color: Colors.grey),
                    label: CustomFont(
                      text: 'Like',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.comment, color: Colors.grey),
                    label: CustomFont(
                      text: 'Comment',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.redo, color: Colors.grey),
                    label: CustomFont(
                      text: 'Share',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ),
                  Divider(color: Colors.grey),

                  SizedBox(height: ScreenUtil().setHeight(10)),
                ],
              ),

              (adsMarket != '')
              ? const SizedBox()
              : Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage(
                      'assets/images/user_avatar.png',
                    ),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setSp(10),
                      0,
                      0,
                      0,
                    ),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(25),
                    width: ScreenUtil().setWidth(330),
                    decoration: BoxDecoration(
                      color: FB_DARK_PRIMARY,
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(20)),
                      ),
                    ),
                    child: CustomFont(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              (adsMarket != '')
              ? const SizedBox()
              : SizedBox(height: ScreenUtil().setHeight(10)),

              (adsMarket != '')
              ? const SizedBox()
              : CustomFont(
                text: 'View comments',
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),

              (adsMarket != '')
                ? Container(
                  padding: EdgeInsets.all(5.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(text: 'MORE DETAILS', fontSize: 17.sp, color: FB_TEXT_COLOR_WHITE),
                          CustomFont(text: adsMarket, fontSize: 17.sp, color: FB_TEXT_COLOR_WHITE, fontWeight: FontWeight.bold,)
                        ],
                      ),
                      CustomInkwellButton(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              userName: userName, 
                              postContent: postContent, 
                              date: date, 
                              avatar: avatar, 
                              image: image,
                              hasImage: hasImage, 
                              hasAvatar: hasAvatar
                            )
                          )
                        ), 
                        bgColor: FB_PRIMARY,
                        height: 40.w, 
                        width: 90.h,
                        icon: Icon(Icons.arrow_right_alt, color: Colors.white),
                      )
                    ],
                  ),
                )
                : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
