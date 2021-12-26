import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_project/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_first_project/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutter_first_project/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter_first_project/shared/components/components.dart';
import 'package:flutter_first_project/shared/components/constants.dart';
import 'package:flutter_first_project/shared/cubit/cubit.dart';
import 'package:flutter_first_project/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {



var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();

var titleController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();
@override

Widget build(BuildContext context) {
  return BlocProvider(
    create: (BuildContext context) => AppCubit()..creatDatabase(),
    child: BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){
        if(state is AppInsertDatabasestate)
        {
          Navigator.pop(context);
        }
      },
      builder: (context,state)
      {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              cubit.title![cubit.currentIndex!],
            ),
          ),
          body: ConditionalBuilder(
            builder: (context)=> cubit.screens![cubit.currentIndex!],
            condition:  true,
            fallback: (context)=> Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:(){
              if(cubit.isBottomSheetShown) {
                if(formKey.currentState!.validate())
                {
                  cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                  );
                }
              }else {
                scaffoldKey.currentState!.showBottomSheet((context) =>
                    Container(
                      padding: EdgeInsetsDirectional.all(20.0,),
                      color: Colors.grey[100],
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            defaultFormField(
                              controller: titleController,
                              type: TextInputType.text,
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return('title must not be empty');
                                }
                                return null;
                              },
                              label: 'task title',
                              prefix: Icons.title,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            defaultFormField(
                              controller: timeController,
                              type: TextInputType.datetime,
                              onTap: ()
                              {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value)
                                {
                                  timeController.text = value!.format(context).toString();
                                });
                              },
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return('time must not be empty');
                                }
                                return null;
                              },
                              label: 'task time',
                              prefix: Icons.watch_later_outlined,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            defaultFormField(
                              controller: dateController,
                              type: TextInputType.datetime,
                              onTap: ()
                              {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2030-12-31'),
                                ).then((value)
                                {
                                  dateController.text = DateFormat.yMMMd().format(value!).toString();
                                });
                              },
                              validate: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return('date must not be empty');
                                }
                                return null;
                              },
                              label: 'task date',
                              prefix: Icons.calendar_today_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
                  elevation: 20.0,
                ).closed.then((value)
                {
                  cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                  );
                });
                cubit.changeBottomSheetState(
                  isShow: true,
                  icon: Icons.add,
                );

              }
            },
            child: Icon(
              cubit.fabIcon,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex!,
            onTap: (index)
            {
              cubit.changeIndex(index);
            },
            items:
            [
              BottomNavigationBarItem(
                icon:Icon(
                  Icons.menu,
                ),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon:Icon(
                  Icons.check_circle_outline,
                ),
                label: 'done',
              ),
              BottomNavigationBarItem(
                icon:Icon(
                  Icons.archive_outlined,
                ),
                label: 'Archived',
              ),
            ],
          ),
        );
      },
    ),
  );
}

}
