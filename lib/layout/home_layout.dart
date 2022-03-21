



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import '../modules/profile/profile_screen.dart';
import '../modules/report/report_screen.dart';
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
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              backgroundColor: primaryColor,
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
                      const Divider(
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
      height: 250,
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          GestureDetector(
            onTap: (){
              navigateTo(context, ProfileScreen());
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 90.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/icons/profile_pic.png"),
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
              fontSize: 17

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
        menuItem(icon: "assets/icons/report.png", text: 'التــقرير', onTap: () { navigateTo(context, ReportScreen()); }),
        menuItem(icon: "assets/icons/search.png", text: 'البحـث', onTap: () { navigateTo(context, SearchScreen()); }),
        menuItem(icon: "assets/images/logo.png", text: 'المسـاعده', onTap: () {  }),
        menuItem(icon: "assets/icons/sign-out.png", text: 'تـسجيل الخروج', onTap: () {  }),
      ],
    ),
  );
}
Widget menuItem({
  required String icon,
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
            Expanded(flex:1,child: Image.asset(icon,height: 40.0,)),
            SizedBox(width: 10.0,),
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


