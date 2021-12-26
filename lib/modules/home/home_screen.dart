import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
            onPressed: ()
            {
              print('Menu is done');
            },
            icon: Icon(
              Icons.menu,
            )),
        title: Text('Riyadh City'
        ),
        actions: [
          IconButton(
              onPressed: ()
          {
            print('Notification is done');
          },
              icon: Icon(
        Icons.notification_important,
      )),
          IconButton(
              onPressed: ()
              {
                print('Search is done');
              }, icon:  Icon(
            Icons.search,
          )),

        ],
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children:
        [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(
                    20.0,
                  ),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: 200,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children:
                [
                  Image(
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg',
                    ),
                  width: 200.0,
                  height: 150.0,
                  fit: BoxFit.fill,
                ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.7),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,

                    ),
                    child: Text(
                      'Flower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,

                      ),

                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}