import 'package:flutter/material.dart';
import 'package:flutter_first_project/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var emailConrtoller = TextEditingController();
  var passwordConrtoller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late bool isPassword ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    type:TextInputType.emailAddress,
                    label: 'Email address',
                    prefix:Icons.email,
                    controller: emailConrtoller,
                      validate: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'email address must not be empty';
                        }
                        return null;
                      },

                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    type:TextInputType.visiblePassword,
                    label: 'Password',
                    prefix:Icons.lock,
                    suffix: Icons.remove_red_eye,
                    suffixPressed: (){
                      setState(()
                      {
                        isPassword = false;
                      }
                      );
                    },
                    controller: passwordConrtoller,
                    isPassword: true,

                    validate: (value)
                    {
                      if(value!.isEmpty)
                        {
                          return 'password must not be empty';
                        }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          print(emailConrtoller.text);
                          print(passwordConrtoller.text);
                        }

                      },
                      text: 'Login',
                    radius: 5.5,
                    isUpperCase : false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children:
                    [
                      Text(
                        'Don\'t have accout?',
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text(
                            'Register now'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}