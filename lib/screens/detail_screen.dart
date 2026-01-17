import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';

//ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final String avatar, image;
  int numOfLikes;
  final bool hasImage, hasAvatar;
  bool hasLiked;

  DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    required this.avatar,
    required this.hasImage,
    required this.hasAvatar,
    this.image = '',
    this.numOfLikes = 0,
    this.hasLiked = false,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late int numOfLikes;

  @override
  void initState() {
    super.initState();
    numOfLikes = widget.numOfLikes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomFont(
          text: widget.userName,
          fontSize: ScreenUtil().setSp(20),
          color: FB_TEXT_COLOR_WHITE,
        ),
        backgroundColor: FB_DARK_PRIMARY,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Container(
        color: FB_DARK_PRIMARY,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              (widget.hasImage)
                  ? ConstrainedBox(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: Image.asset(widget.image, fit: BoxFit.cover),
                    )
                  : SizedBox(height: ScreenUtil().setHeight(0)),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (widget.hasAvatar)
                        ? CircleAvatar(
                            radius: ScreenUtil().setSp(25),
                            backgroundImage: AssetImage(widget.avatar),
                          )
                        : CircleAvatar(
                            radius: 18,
                            backgroundColor: FB_LIGHT_PRIMARY,
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
                          text: widget.userName,
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomFont(
                              text: widget.date,
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.grey,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Icon(
                              Icons.public,
                              size: ScreenUtil().setSp(15),
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(15)),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                alignment: Alignment.centerLeft,
                child: CustomFont(
                  text: widget.postContent,
                  fontSize: ScreenUtil().setSp(18),
                  color: FB_TEXT_COLOR_WHITE,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(30)),
              Divider(color: FB_LIGHT_PRIMARY),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          if (!widget.hasLiked) {
                            numOfLikes++;
                            widget.hasLiked = true;
                          } else {
                            numOfLikes--;
                            widget.hasLiked = false;
                          }
                        });
                        print(numOfLikes);
                      },
                      icon: const Icon(Icons.thumb_up, color: Colors.grey),
                      label: CustomFont(
                        text: (numOfLikes == 0)
                            ? 'Like'
                            : numOfLikes.toString(),
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_TEXT_COLOR_WHITE,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment, color: Colors.grey),
                      label: CustomFont(
                        text: 'Comment',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_TEXT_COLOR_WHITE,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.redo, color: Colors.grey),
                      label: CustomFont(
                        text: 'Share',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_TEXT_COLOR_WHITE,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
