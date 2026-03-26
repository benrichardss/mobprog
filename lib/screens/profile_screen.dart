import '../widgets/custom_dialogs.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../widgets/custom_info.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_font.dart';
import '../constants.dart';
import '../widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  final String? username;
  final String coverImgUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlCpRucIFGyZferNJXuQn9GWJNqndFqVbd4A&s';
  final String profileImgUrl = 
      'https://media.discordapp.net/attachments/856874434605744142/1443981776560324679/sketch-1688837704405.jpg?ex=697631d3&is=6974e053&hm=f0917d728382d0aacc3c7b9295c8d226c6d59debe534a69663f11a724f678222&=&format=webp&width=648&height=648';
  const ProfileScreen({super.key, this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: FB_DARK_PRIMARY,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CachedNetworkImage(
                    height: 275,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    imageUrl: widget.coverImgUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                              color: FB_DARK_PRIMARY,
                              value: downloadProgress.progress,
                            ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, size: 100.sp),
                  ),
                  Positioned(
                    bottom: -50,
                    left: ScreenUtil().setWidth(20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            imageUrl: widget.profileImgUrl,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                      color: FB_DARK_PRIMARY,
                                      value: downloadProgress.progress,
                                    ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(55)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: widget.username ?? 'Username',
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20),
                      color: FB_TEXT_COLOR_WHITE,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    Row(
                      children: [
                        CustomFont(
                          text: '6.7m',
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomFont(
                          text: 'followers',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        Icon(
                          Icons.circle,
                          size: ScreenUtil().setSp(5),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        CustomFont(
                          text: '0',
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomFont(
                          text: 'following',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Row(
                      children: [
                        CustomButton(buttonName: 'Follow', onPressed: () {}),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomButton(
                          buttonName: 'Message',
                          onPressed: () {},
                          buttonType: 'outlined',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              TabBar(
                indicatorColor: FB_PRIMARY,
                tabs: [
                  Tab(
                    child: CustomFont(
                      text: 'Posts',
                      fontSize: ScreenUtil().setSp(15),
                      color: FB_TEXT_COLOR_WHITE,
                    ),
                  ),
                  Tab(
                    child: CustomFont(
                      text: 'About',
                      fontSize: ScreenUtil().setSp(15),
                      color: FB_TEXT_COLOR_WHITE,
                    ),
                  ),
                  Tab(
                    child: CustomFont(
                      text: 'Photos',
                      fontSize: ScreenUtil().setSp(15),
                      color: FB_TEXT_COLOR_WHITE,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(2000),
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        PostCard(
                          userName: widget.username ?? 'Username',
                          postContent: 'hahahaha ynnuf ka talaga @benrichards!!',
                          hasAvatar: true,
                          avatar: 'assets/images/user_avatar.png',
                          numOfLikes: 1,
                          numOfComments: 1,
                          numOfShares: 0,
                          hasImage: false,
                          date: '1m',
                        ),
                        PostCard(
                          userName: widget.username ?? 'Username',
                          postContent: 'makikiuso lang hahahah 🤪',
                          hasAvatar: true,
                          avatar: 'assets/images/user_avatar.png',
                          image: 'assets/images/line.png',
                          numOfLikes: 7,
                          numOfComments: 9,
                          numOfShares: 2,
                          hasImage: true,
                          date: '6d',
                        ),
                        PostCard(
                          userName: widget.username ?? 'Username',
                          postContent: 'lala kasama hahahahhaah',
                          hasAvatar: true,
                          avatar: 'assets/images/user_avatar.png',
                          image: 'assets/images/valorant.png',
                          numOfLikes: 45,
                          numOfComments: 6,
                          numOfShares: 8,
                          hasImage: true,
                          date: '2w',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(10),
                            left: ScreenUtil().setWidth(10),
                          ),
                          child: CustomFont(
                            text: 'Work',
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.bold,
                            color: FB_TEXT_COLOR_WHITE,
                          ),
                        ),
                        CustomInfoModified(
                          name: 'Worked at Krusty Krab',
                          description: 'October 2020 - Present',
                          hasSubDescription: true,
                          subDescription: 'Bikini Bottom',
                          hasAvatar: false,
                          changeLeading: true,
                          iconLeading: Icons.work,
                          nullifyTrailing: true,
                          hasImage: false,
                          atProfile: true,
                        ),
                        Divider(color: FB_LIGHT_PRIMARY),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(10),
                            left: ScreenUtil().setWidth(10),
                          ),
                          child: CustomFont(
                            text: 'Education',
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.bold,
                            color: FB_TEXT_COLOR_WHITE,
                          ),
                        ),
                        CustomInfoModified(
                          name: 'Studies at National University Philippines',
                          description: '2023 - Present',
                          hasSubDescription: false,
                          hasAvatar: true,
                          avatar: 'assets/images/nu_logo.png',
                          changeLeading: false,
                          nullifyTrailing: true,
                          hasImage: false,
                          atProfile: true,
                        ),
                        Divider(color: FB_LIGHT_PRIMARY),
                        CustomInfoModified(
                          name: 'Studied at Bikini Bottom High School',
                          description: '2016 - 2020',
                          hasSubDescription: false,
                          hasAvatar: false,
                          changeLeading: true,
                          iconLeading: Icons.school,
                          nullifyTrailing: true,
                          hasImage: false,
                          atProfile: true,
                        ),
                        Divider(color: FB_LIGHT_PRIMARY),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(10),
                            left: ScreenUtil().setWidth(10),
                          ),
                          child: CustomFont(
                            text: 'Places lived',
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.bold,
                            color: FB_TEXT_COLOR_WHITE,
                          ),
                        ),
                        CustomInfoModified(
                          name: 'Bikini Bottom',
                          description: 'Hometown',
                          hasSubDescription: false,
                          hasAvatar: false,
                          changeLeading: true,
                          iconLeading: Icons.location_on,
                          nullifyTrailing: true,
                          hasImage: false,
                          atProfile: true,
                        ),
                        Divider(color: FB_LIGHT_PRIMARY),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(10),
                            left: ScreenUtil().setWidth(10),
                          ),
                          child: CustomFont(
                            text: 'Contact info',
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.bold,
                            color: FB_TEXT_COLOR_WHITE,
                          ),
                        ),
                        CustomInfoModified(
                          name: 'aronbautista',
                          description: 'Instagram',
                          hasSubDescription: false,
                          hasAvatar: false,
                          changeLeading: true,
                          iconLeading: Icons.link,
                          nullifyTrailing: true,
                          hasImage: false,
                          atProfile: true,
                        ),
                        Divider(color: FB_LIGHT_PRIMARY),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(10),
                            left: ScreenUtil().setWidth(10),
                          ),
                          child: CustomFont(
                            text: 'Basic info',
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.bold,
                            color: FB_TEXT_COLOR_WHITE,
                          ),
                        ),
                        CustomInfoModified(
                          name: 'he/him',
                          description: 'Pronouns',
                          hasSubDescription: false,
                          hasAvatar: false,
                          changeLeading: true,
                          iconLeading: Icons.chat,
                          nullifyTrailing: true,
                          hasImage: false,
                          atProfile: true,
                        ),
                        Divider(color: FB_LIGHT_PRIMARY),
                        CustomInfoModified(
                          name: 'June 30, 2020',
                          description: 'Birthday',
                          hasSubDescription: false,
                          hasAvatar: false,
                          changeLeading: true,
                          iconLeading: Icons.cake,
                          nullifyTrailing: true,
                          hasImage: false,
                          atProfile: true,
                        ),
                        Divider(color: FB_LIGHT_PRIMARY),
                      ],
                    ),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      physics: const NeverScrollableScrollPhysics(),

                      children: [
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/valorant.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: () => customShowImageDialog(context, image: 'assets/images/valorant.png',),
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/line.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=> customShowImageDialog(context, image: 'assets/images/line.png'),
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/cover_photo.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=> customShowImageDialog(context, image: 'assets/images/cover_photo.png'),
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/user_avatar.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=> customShowImageDialog(context, image: 'assets/images/user_avatar.png'),
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/cat1.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=> customShowImageDialog(context, image: 'assets/images/cat1.png'),
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/cat2.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=> customShowImageDialog(context, image: 'assets/images/cat2.png'),
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/cat3.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=> customShowImageDialog(context, image: 'assets/images/cat3.png'),
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/discord_mod.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=> customShowImageDialog(context, image: 'assets/images/discord_mod.png'),
                        ),
                        
                        
                        
                        
                        
                        
                        
                        
                      ],
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
