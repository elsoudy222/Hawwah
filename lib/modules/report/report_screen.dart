import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool sel =false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
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
          child: SafeArea(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                      ),
                      iconSize: 40,
                    ),
                    const Text(
                      'التقرير',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  padding:
                  const EdgeInsets.only(top: 35),
                  child: Column(
                    children: [
                      SizedBox( height: 22, ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: const Color.fromRGBO(253, 220, 230, 1.0),
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Image.asset(
                                'assets/icons/magnifier.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/download.png',color: Color.fromRGBO(206, 86, 139, 1),),
                          ),
                          SizedBox(width: 10,),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/printer.png'),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                sel =! sel;
                                print(sel);

                              });
                            },
                            child: const Text(
                              ' تحديد ',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Color.fromRGBO(206, 86, 139, 1)),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return ItemReport(
                              isSelacted: sel,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 25,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}




class ItemReport extends StatefulWidget {
  bool ?isSelacted;
  ItemReport({
    Key ?key,
    @required this.isSelacted,
  }) : super(key: key);

  @override
  _ItemReportState createState() => _ItemReportState();
}

class _ItemReportState extends State<ItemReport> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color.fromRGBO(206, 86, 139, 1);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSelacted!
        ? Row(
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset:
                  const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: const Color.fromRGBO(253, 220, 230, 1.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ExpansionTile(
              collapsedIconColor: const Color.fromRGBO(206, 86, 139, 1),
              iconColor: const Color.fromRGBO(206, 86, 139, 1),
              collapsedBackgroundColor:
              const Color.fromRGBO(249, 237, 241, 1),
              backgroundColor: const Color.fromRGBO(249, 237, 241, 1),
              title: const Text(
                '',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(18.0),
                  height: 150,
                )
              ],
            ),
          ),
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool ?value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
      ],
    )
        : Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: const Color.fromRGBO(253, 220, 230, 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ExpansionTile(
        collapsedIconColor: const Color.fromRGBO(206, 86, 139, 1),
        iconColor: const Color.fromRGBO(206, 86, 139, 1),
        collapsedBackgroundColor:
        const Color.fromRGBO(249, 237, 241, 1),
        backgroundColor: const Color.fromRGBO(249, 237, 241, 1),
        title: const Text(
          '',
          style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(18.0),
            height: 150,
          )
        ],
      ),
    );
  }
}