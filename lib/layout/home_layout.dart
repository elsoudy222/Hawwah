import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

import 'cubit/home_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "حـواء",
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search,),
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.menu,),
                  onPressed: () {},
                ),

              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),

            // bottomNavigationBar: CircleBottomNavigationBar(
            //   initialSelection: cubit.currentIndex,
            //   circleColor: primaryColor,
            //   activeIconColor: Colors.white,
            //   inactiveIconColor: Colors.grey,
            //   tabs: cubit.bottomNavItems,
            //   onTabChangedListener: (int index) {
            //     cubit.changeBottomNavBar(index);
            //   },
            // ),

          );
        },
      ),
    );
  }
}


