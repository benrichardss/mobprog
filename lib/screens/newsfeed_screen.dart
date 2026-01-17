import 'package:flutter/material.dart';
import '../widgets/post_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        PostCard(
          userName: 'Memester',
          postContent: 'didn\'t know goofy was this tuff 🥶',
          hasAvatar: true,
          avatar: 'assets/images/avatar1.png',
          image: 'assets/images/goofy.png',
          numOfLikes: 911,
          numOfComments: 420,
          numOfShares: 69,
          hasImage: true,
          date: '12h',
        ),
        PostCard(
          userName: 'benrichards',
          postContent: 'lakad matatag hahahahhaah',
          hasAvatar: false,
          avatar: 'assets/images/avatar2.png',
          image: 'assets/images/screenshot.png',
          numOfLikes: 67,
          numOfComments: 12,
          numOfShares: 5,
          hasImage: true,
          date: '43m',
        ),
        PostCard(
          userName: 'JackBowe',
          postContent: 'Just bought my first NFT!\n#excited',
          hasAvatar: true,
          avatar: 'assets/images/avatar3.png',
          image: 'assets/images/avatar3.png',
          numOfLikes: 45,
          numOfComments: 8,
          numOfShares: 3,
          hasImage: true,
          date: '1d',
        ),
        PostCard(
          userName: 'QueenBee',
          postContent: 'Loving the new vibes!\n#freshstart',
          hasAvatar: true,
          avatar: 'assets/images/avatar4.png',
          image: 'assets/images/line.png',
          numOfLikes: 320,
          numOfComments: 75,
          numOfShares: 12,
          hasImage: true,
          date: '13h',
        ),
        PostCard(
          userName: 'xX_DarkKnight_Xx',
          postContent: 'i am the dark knight.',
          hasAvatar: true,
          avatar: 'assets/images/avatar5.png',
          numOfLikes: 80,
          numOfComments: 50,
          numOfShares: 9,
          hasImage: false,
          date: '2d',
        ),
      ]
    );
  }
}
