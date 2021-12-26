import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children:
          [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1454091935103307776/aBfq_oqr_400x400.jpg',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions:
        [
          IconButton(
            onPressed: () {

            },
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          IconButton(
            onPressed: () {

            },
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children:
                  [
                    Icon(Icons.search,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index)=>buildStoryItem(),
                    separatorBuilder:(context,index)=>SizedBox(
                      width: 20.0,
                    ),
                    itemCount: 8,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index)=>buildChatItem(),
                  separatorBuilder: (context,index)=>SizedBox(
                    height: 15.0,
                  ),
                  itemCount: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children:
      [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1454091935103307776/aBfq_oqr_400x400.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2.0,
                end: 2.0,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 7.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          'Barak Obama Ali Ibrahim',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

      ],
    ),
  );
  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1454091935103307776/aBfq_oqr_400x400.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 2.0,
                  end: 2.0,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 7.0,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(
                  'Ahmed Hassan Yassein',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 7.0,
                ),
                Row(
                  children:
                  [
                    Expanded(
                      child: Text(
                        'Hello my name is Ahmed!',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                        '02:00 PM'
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
}
