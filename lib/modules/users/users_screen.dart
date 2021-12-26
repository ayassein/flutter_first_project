import 'package:flutter/material.dart';
import 'package:flutter_first_project/models/user/user_model.dart';



class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Ahmed Hassan',
      phone: '+201025303724',
    ),
    UserModel(
      id: 2,
      name: 'Amr Fathi',
      phone: '+201025305000',
    ),
    UserModel(
      id: 3,
      name: 'Ali Ahmed',
      phone: '+201025304000',
    ),
    UserModel(
      id: 1,
      name: 'Ahmed Hassan',
      phone: '+201025303724',
    ),
    UserModel(
      id: 2,
      name: 'Amr Fathi',
      phone: '+201025305000',
    ),
    UserModel(
      id: 3,
      name: 'Ali Ahmed',
      phone: '+201025304000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>buildUserItem(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
      ),
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget buildUserItem(UserModel user)=> Padding(
    padding: const EdgeInsetsDirectional.all(20.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(''
                '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
