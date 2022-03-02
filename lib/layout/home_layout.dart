
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'cubit/home_cubit.dart';

class HomeLayout extends StatelessWidget {
   HomeLayout({Key? key}) : super(key: key);


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
              title: Text("${cubit.appbar[cubit.currentIndex]}"),
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
            // bottomNavigationBar: CircleNavBar(
            //   activeIcons:cubit.activeIcons,
            //   inactiveIcons: cubit.inactiveIcons,
            //   color: secondaryColor,
            //   height: 60,
            //   circleWidth: 60,
            //   initIndex: cubit.currentIndex,
            //   onChanged: (index) {
            //     cubit.changeBottomNavBar(index);
            //   },
            //   elevation: 10,
            //   padding: const EdgeInsets.all(10.0),
            //   cornerRadius: const BorderRadius.only(
            //     topLeft: Radius.circular(8),
            //     topRight: Radius.circular(8),
            //
            //   ),
            // ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}


