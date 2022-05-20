import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/search/repository/maps_repo.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/profile/profile_screen.dart';
import '../modules/report/report_screen.dart';
import '../modules/search/cubit/search_cubit.dart';
import '../shared/network/remote/search_helper.dart';
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
              title: const Text('حَوَّاء '),
              backgroundColor: secondaryColor,
              elevation: 0,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Image(
                    image: AssetImage(
                      "assets/images/drawer.png",
                    ),
                  ),
                ),
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              // if the kyeboard is open then hide, else show
              child: GestureDetector(
                onTap: () {
                  cubit.changeBottomNavBar(2);
                },
                child: Container(
                  width: 52.0,
                  height: 47.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/home.png',
                      color:
                          cubit.currentIndex == 2 ? thirdColor : Colors.black87,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(26.0, 23.5)),
                    color: Colors.white,
                    border: Border.all(
                      width: 2.0,
                      color: const Color(0xFFFDDCE6),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        offset: const Offset(0, 3.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              // color: Colors.green,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const CircularNotchedRectangle(),
              // notchMargin: 10,
              // elevation: 10,
              child: BottomNavigationBar(
                elevation: 0,
                // type: BottomNavigationBarType.fixed,
                backgroundColor: secondaryColor,
                items: cubit.bottomNavItems,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            ),
            drawer: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Drawer(
                backgroundColor: secondaryColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:  Border.all(
                        color: Colors.white,
                        width: 2
                    ),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(248, 157, 185, 1.0),
                          Color.fromRGBO(250, 250, 250, 1.0)
                        ]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *.06,
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            "assets/icons/menu_white.png",
                            height: 40.0,
                          ),
                        ),
                      ),
                      const drawerHeader(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.white,
                      ),
                      drawerBody(context),
                    ],
                  ),
                ),
              ),
            ),);},),);}}
class drawerHeader extends StatelessWidget {
  const drawerHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            navigateTo(context,  ProfileScreen());
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 100.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: thirdColor),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: const AssetImage("assets/icons/profile_pic.png",),
                )),
          ),
        ),
        Text(
          "الاسم",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: thirdColor, fontSize: 25.0),
        ),
        const Text(
          "info@gmail.com",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ],
    );
  }
}

Widget drawerBody(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      menuItem(
          icon: "assets/icons/report.png",
          text: 'التــقرير',
          onTap: () {
            HomeCubit.get(context).getReportData();
            navigateTo(context, ReportScreen());
          }),
      const Divider(
        thickness: 1,
        height: 1,
        color: Colors.white,
      ),
      menuItem(
          icon: "assets/icons/search.png",
          text: 'البحـث',
          onTap: ()  {
            navigateTo(context, BlocProvider(
              create: (context) => SearchCubit(MapsRepo(SearchHelper())),
              child: const SearchScreen(),
            ),);
          }),
      const Divider(
        thickness: 1,
        height: 1,
        color: Colors.white,
      ),
      menuItem(icon: "assets/images/help.png", text: 'المسـاعده', onTap: () {}),
      const Divider(
        thickness: 1,
        height: 1,
        color: Colors.white,
      ),
      menuItem(
          icon: "assets/icons/sign-out.png",
          text: 'تـسجيل الخروج',
          onTap: () {
            signOut(context);
          }),
    ],
  );
}

Widget menuItem({
  required String icon,
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Image.asset(
                icon,
                height: 40.0,
              )),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
              flex: 3,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
              )),
        ],
      ),
    ),
  );
}
