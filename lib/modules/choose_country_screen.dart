import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubbit.dart';
import 'package:news_app/layout/layout.dart';

import '../cubit/states.dart';

class ChooseCountryScreen extends StatefulWidget {
  @override
  _ChooseCountryScreenState createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  @override
  var countryList = [
    'eg',
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'co',
    'cu',
    'cz',
    'de',
    'fr'
  ];

  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => NewsCubit()),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text("News App"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Choose Your Country',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      iconSize: 50,
                      value: NewsCubit.get(context).selectedValue,
                      items: countryList.map((e) {
                        return DropdownMenuItem<String>(
                          child: Text(
                            e.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          ),
                          value: e.toString(),
                        );
                      }).toList(),
                      onChanged: (item) {
                        NewsCubit.get(context).onDropDownChange(item);
                      },
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            height: 50,
                            width: 100,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Layout()));
                                },
                                child: Text(
                                  'next',
                                  style: TextStyle(color: Colors.white),
                                )))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
