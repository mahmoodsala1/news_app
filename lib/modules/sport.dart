import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubbit.dart';
import 'package:news_app/cubit/states.dart';

import '../shared/component.dart';

class Sport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getSports(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return NewsCubit.get(context).sports!.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => articleBuildItem(
                      NewsCubit.get(context).sports![index], context),
                  separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: Colors.grey,
                        width: double.infinity,
                      ),
                  itemCount: NewsCubit.get(context).sports!.length);
        },
      ),
    );
  }
}
