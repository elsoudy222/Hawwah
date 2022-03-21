import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawwah/modules/search/search_screen.dart';

class SearchLap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color.fromRGBO(236, 156, 184, 90.0),
          //   title: Text(
          //     'البحث',
          //     textDirection: TextDirection.rtl,
          //   ),
          //   actions: [
          //       Image(image: AssetImage('assets/icons/lab.png')),
          //   ],
          // ),
          body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/map.png'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SearchScreen()));
                      },
                      icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'البحث',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                    Image(image: AssetImage(
                        'assets/icons/search_laboratory.png',

                    ),
                    height: 50,),
                  ],
                ),
                SizedBox(height:50 ,),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '                                                                 القاهره',
                          hintStyle: TextStyle(
                          ),
                          suffixIcon: Icon(Icons.search ),

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
