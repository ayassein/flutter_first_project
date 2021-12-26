import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_project/shared/components/components.dart';
import 'package:flutter_first_project/shared/components/constants.dart';
import 'package:flutter_first_project/shared/cubit/cubit.dart';
import 'package:flutter_first_project/shared/cubit/states.dart';

class ArchiveTasksScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state) {},
      builder:(context,state){

        var tasks = AppCubit.get(context).archiveTasks;
        return tasksBuilder(tasks: tasks,);
      } ,
    );
  }
}