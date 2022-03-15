

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import '../modules/profile/profile_screen.dart';
import '../modules/report/report_screen.dart';
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
              title: Text("حــواء"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search,),
                  onPressed: () {
                    navigateTo(context,  SearchScreen());
                  },
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
            drawer: Drawer(
              backgroundColor: secondaryColor,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      const drawerHeader(),
                      Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      drawerBody(context),
                    ],
                  ),
                ),
              )
            ),
          );
        },
      ),
    );
  }
}

class drawerHeader extends StatelessWidget {
  const drawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          GestureDetector(
            onTap: (){
              navigateTo(context, Profile());
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 70.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                )
              ),
            ),
          ),
          const Text(
            "LADY NAME",
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pink,
              fontSize: 25.0

            ),
          ),
          const Text(
            "info@gmail.com",
            style: TextStyle(
              color: Colors.white,

            ),
          ),
        ],
      ),

    );
  }
}

Widget drawerBody(context){
  return Container(
    color: secondaryColor,
    height: MediaQuery.of(context).size.height - 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        menuItem(icon: Icons.book_outlined, text: 'التــقرير', onTap: () { navigateTo(context, ReportScreen()); }),
        menuItem(icon: Icons.help_outline, text: 'المسـاعده', onTap: () {  }),
        menuItem(icon: Icons.logout_outlined, text: 'تـسجيل الخروج', onTap: () {  }),
      ],
    ),
  );
}


Widget menuItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}){
  return Material(
    color: secondaryColor,
    child: InkWell(
      onTap: (){
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children:  [
            Expanded(flex:1,child: Icon(icon,size: 30.0,color: Colors.pink,)),
            Expanded(flex:3,child: Text(
                text,
              style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 25.0

              ),
            )),
          ],
        ),
      ),
    ),
  );
}


