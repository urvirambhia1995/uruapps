import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(
      child: Text(
        "Delivery",
        style: TextStyle(
            color: Color(0xff000000),
            fontFamily: "inter",
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
      ),
    ),
    const Tab(
      child: Text(
        "Subscription",
        style: TextStyle(
            color: Color(0xff000000),
            fontFamily: "inter",
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
      ),
    ),
    const Tab(
      child: Text(
        "Reviews",
        style: TextStyle(
            color: Color(0xff000000),
            fontFamily: "inter",
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
      ),
    ),
  ];
  List<dynamic> foodItem = [
    {"foodName": "Vada Pav", "qty": 2},
    {"foodName": "Vada Pav", "qty": 3},
    {"foodName": "Vada Pav", "qty": 4},
    {"foodName": "Vada Pav", "qty": 5},
    {"foodName": "Vada Pav", "qty": 8},
    {"foodName": "Idli", "qty": 8},
    {"foodName": "Idli", "qty": 2},
    {"foodName": "Idli", "qty": 1},
    {"foodName": "Dosa", "qty": 1},
    {"foodName": "Dosa", "qty": 4},
    {"foodName": "Pani Puri", "qty": 2},
    {"foodName": "Pani Puri", "qty": 4},
    {"foodName": "Pani Puri", "qty": 1},
    {"foodName": "Medu Vada", "qty": 1},
    {"foodName": "Medu Vada", "qty": 4},
    {"foodName": "Medu Vada", "qty": 3},
    {"foodName": "Bhajiya", "qty": 3},
    {"foodName": "Bhajiya", "qty": 2},
  ];
  late List<Map<String, dynamic>> uniqueFoodItems;

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, int> foodMap = {};

    for (var item in foodItem) {
      String foodName = item["foodName"];
      int qty = item["qty"];

      if (foodMap.containsKey(foodName)) {
        foodMap[foodName] = foodMap[foodName]! + qty; // Add the quantity to the existing value
      } else {
        foodMap[foodName] = qty;  // Add a new entry with the quantity
      }
    }
    uniqueFoodItems = foodMap.entries
        .map((entry) => {
      "foodName": entry.key,
      "qty": entry.value,
    })
        .toList();

    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mainUI());
  }

  mainUI() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          //Header Section
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff26B3D2), Color(0Xff1423A5)])),
            child: Column(
              children: [
                //heart and share
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 34,
                    width: 74,
                    padding: const EdgeInsets.only(left: 5),
                    alignment: Alignment.center,
                    color: Color(0XffFFFFFF),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "Assets/heart.png",
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "Assets/Share.png",
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                //header text
                Container(
                  margin: EdgeInsets.only(top: 55, left: 10),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Dil Se Foodie",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decorationThickness: 10,
                            fontSize: 22,
                            fontFamily: "inter"),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Multi-cuisine, Gaon Pickels, Marinades",
                        style: TextStyle(
                            color: Color(0XffFFCF4D), fontFamily: "inter"),
                      ),
                      Text(
                        "Bandra West, Mumbai, Maharashtra",
                        style:
                            TextStyle(color: Colors.white, fontFamily: "inter"),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "2 Kms",
                        style:
                            TextStyle(color: Colors.white, fontFamily: "inter"),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                //reviews & action
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                    alignment: Alignment.bottomCenter,
                    // color: Color(0x3D000000),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0x3D000000)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset("Assets/star.png"),
                            const Text(
                              "4.5 (50 Reviews)",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            Image.asset("Assets/active.png"),
                            const Text(
                              "Active",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //tabs section
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Scaffold(
              body: DefaultTabController(
                length: _tabController.length,
                child: Scaffold(
                  body: Column(
                    children: [
                      TabBar(
                        indicatorColor: Color(0xff112982),
                        controller: _tabController,
                        tabs: myTabs,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Container(
                              color: Colors.white,
                              child: ListView.builder(
                                itemCount: uniqueFoodItems.length,
                                itemBuilder: (context, index) {
                                  var item = uniqueFoodItems[index];
                                  return ListTile(
                                    title: Card(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color: Colors.white24,
                                            width: 1.0,
                                          ),

                                          borderRadius:
                                              BorderRadius.circular(2)),

                                      elevation: 10,
                                      shadowColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Card(

                                                        shape: RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                              color: Colors.green,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius.circular(0)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Image.asset("Assets/Veg.png",),
                                                        )),
                                                    const SizedBox(width: 2,),
                                                    const Text("Veg",style: TextStyle(color: Colors.green),)
                                                  ],
                                                ),
                                                Text(
                                                  item["foodName"],
                                                  style: const TextStyle(
                                                      color: Color(0x3c000000),
                                                      fontFamily: "inter",
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.bold,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              elevation: 10,
                                              shadowColor: Colors.white,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      "Qty",
                                                      style: TextStyle(
                                                          color: Color(0xff000000),
                                                          fontFamily: "inter",
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle:
                                                          FontStyle.normal),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      item["qty"].toString(),
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xff59b052),
                                                          fontFamily: "inter",
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle:
                                                          FontStyle.normal),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              color: Colors.white24,
                              alignment: Alignment.center,
                              child: const Text("This is Subscription Page"),
                            ),
                            Container(
                              color: Colors.white24,
                              alignment: Alignment.center,
                              child: const Text("This is Reviews Page"),                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
