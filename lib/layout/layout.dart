import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubbit.dart';
import 'package:news_app/cubit/states.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getHealth()
        ..getSports()
        ..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      label: "Health",
                      icon: Icon(Icons.health_and_safety),
                    ),
                    BottomNavigationBarItem(
                      label: 'Sports',
                      icon: Icon(Icons.sports),
                    ),
                    BottomNavigationBarItem(
                        label: 'Scince', icon: Icon(Icons.science)),
                  ],
                  type: BottomNavigationBarType.fixed,
                  currentIndex: NewsCubit.get(context).currentIndex,
                  onTap: (index) {
                    NewsCubit.get(context).changeBottomNav(index);
                  }),
              body: NewsCubit.get(context)
                  .widgetList[NewsCubit.get(context).currentIndex],
            );
          }),
    );
  }
}
