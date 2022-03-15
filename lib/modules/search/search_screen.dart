//
//
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hawwah/modules/search/cubit/search_cubit.dart';
// import 'package:hawwah/shared/components/components.dart';
//
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var formKey = GlobalKey<FormState>();
//     var searchController = TextEditingController();
//     return BlocProvider(
//   create: (context) => SearchCubit(),
//   child: BlocConsumer<SearchCubit, SearchStates>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//                 "البــحث",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//             centerTitle: true,
//
//           ),
//
//           body: Form(
//             key: formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   defaultFormField(
//                       controller: searchController,
//                       keyboardType: TextInputType.text,
//                       label: "Search",
//                       prefix: Icons.search,
//                     validate: (String? value){
//                         if(value!.isEmpty){
//                           print("Enter text tot search");
//                         }
//                         return null;
//                     },
//                     onSubmit: (String text){
//                         SearchCubit.get(context).search(text);
//                     }
//                   ),
//                   SizedBox(height: 10.0,),
//                   if(state is SearchLoadingState)
//                   LinearProgressIndicator(),
//                   SizedBox(height: 10.0,),
//                   //if(state is SearchSuccessState)
//                   // Expanded(
//                   //   child: ListView.separated(
//                   //     physics: BouncingScrollPhysics(),
//                   //      itemBuilder: (context, index) => buildListProduct(
//                   //         SearchCubit.get(context).model.data.data[index],
//                   //       context,
//                   //       isOldPrice: false
//                   //     ),
//                   //     separatorBuilder: (context, index) => Container(
//                   //       height: 1,
//                   //       width: 1,
//                   //       color: Colors.grey,
//                   //     ),
//                   //    // itemCount: SearchCubit.get(context).model.data.data.length,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     ),
// );
//   }
// }


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 157, 185, 1.0),
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {},
              icon: Image.asset(
                'assets/images/logo.png',
              )),

        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(249, 157, 185, 1.0),
                    Color.fromRGBO(253, 220, 230, 1.0)
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(image: AssetImage('assets/images/logo.png'),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: HexColor('FDDCE6'),
                    ),
                    child: TextFormField(
                      decoration:InputDecoration(
                        prefixIcon: Image.asset('assets/icons/search.png'),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder:(context,index)=>Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: HexColor('FDDCE6'),                         ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image(image: AssetImage('assets/icons/doctor.png'),
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(end: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text('محمد عمرو',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text('دكتور امراض نساء',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icons/doctor.png'),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context,index)=>SizedBox(
                      height: 15,
                    ),
                    itemCount: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
