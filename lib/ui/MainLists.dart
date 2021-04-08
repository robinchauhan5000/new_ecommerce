import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';

class MainListPage extends StatefulWidget {
  @override
  _MainListPageState createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffE33B3B),
        onPressed: () {},
        child: Icon(
          Icons.shopping_cart,
        ),
      ),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Colors.white),
          onPressed: () {},
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff0D72A0),
        elevation: 0,
        actions: <Widget>[
          new NotificationWidget(
              iconColor: Colors.white,
              labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff0D72A0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0.h),
                      bottomRight: Radius.circular(8.0.h),
                    ),
                  ),
                  height: 45.0.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.0.h),
                        child: Image.asset(
                          "assets/listogetlogo1.png",
                          height: 7.0.h,
                        ),
                      ),
                      Container(
                        width: 80.0.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0.h)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.search),
                              hintText: "Search",
                              border: InputBorder.none),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0.h),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.h, horizontal: 14.0.h),
                              child: Text(
                                "Create New List",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            height: 7.0.h,
                            width: 80.0.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE33B3B),
                                borderRadius: BorderRadius.circular(20.0.h)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0.h),
                  child: Column(
                    children: [
                      Text(
                        "Previous List",
                        style: TextStyle(
                            fontSize: 16.0.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/Monthly');
                  },
                  child: Container(
                    height: 13.0.h,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Monthly List",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 2.0.h),
                                child: Text(
                                  "Money Spent:3500",
                                  style: TextStyle(color: Color(0xff929292)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Item Qty:35",
                                style: TextStyle(color: Color(0xff929292)),
                              ),
                              Image.asset("assets/plus.png"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    height: 13.0.h,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Occassion List",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 2.0.h),
                                child: Text(
                                  "Money Spent:3500",
                                  style: TextStyle(color: Color(0xff929292)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Item Qty:35",
                                style: TextStyle(color: Color(0xff929292)),
                              ),
                              Image.asset("assets/plus.png"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    height: 13.0.h,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Daily List",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 2.0.h),
                                child: Text(
                                  "Money Spent:3500",
                                  style: TextStyle(color: Color(0xff929292)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Item Qty:35",
                                style: TextStyle(color: Color(0xff929292)),
                              ),
                              Image.asset("assets/plus.png"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
