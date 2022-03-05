

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/search/cubit/search_cubit.dart';
import 'package:hawwah/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
  create: (context) => SearchCubit(),
  child: BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                "البــحث",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            centerTitle: true,

          ),

          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      label: "Search",
                      prefix: Icons.search,
                    validate: (String? value){
                        if(value!.isEmpty){
                          print("Enter text tot search");
                        }
                        return null;
                    },
                    onSubmit: (String text){
                        SearchCubit.get(context).search(text);
                    }
                  ),
                  SizedBox(height: 10.0,),
                  if(state is SearchLoadingState)
                  LinearProgressIndicator(),
                  SizedBox(height: 10.0,),
                  //if(state is SearchSuccessState)
                  // Expanded(
                  //   child: ListView.separated(
                  //     physics: BouncingScrollPhysics(),
                  //      itemBuilder: (context, index) => buildListProduct(
                  //         SearchCubit.get(context).model.data.data[index],
                  //       context,
                  //       isOldPrice: false
                  //     ),
                  //     separatorBuilder: (context, index) => Container(
                  //       height: 1,
                  //       width: 1,
                  //       color: Colors.grey,
                  //     ),
                  //    // itemCount: SearchCubit.get(context).model.data.data.length,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    ),
);
  }
}
