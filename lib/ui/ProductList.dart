import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import'package:sizer/sizer.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0D72A0),
        elevation: 0,
        actions: <Widget>[
          new NotificationWidget(
              iconColor: Colors.white,
              labelColor: Theme.of(context).accentColor),
        ],
      ),
      backgroundColor: Color(0XFFEFF2FF),
      drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/drawer/Rectangle 55.jpg'),
                    fit: BoxFit.cover
                )
            ),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: SizeConfig.blockSizeVertical * 5,
                        backgroundColor: Colors.white,
                        child: Image(image: AssetImage(''),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.5
                        ),
                        child: Text("User Name",style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockSizeVertical * 2.25
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 0.08
                        ),
                        child: Text("Username@mail.com",style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockSizeVertical *1.5
                        ),),
                      )
                    ],
                  ),
                ),
                Container(child: Image(image: AssetImage('assets/drawer/Line 1.jpg'))),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4.5,
                      left: SizeConfig.blockSizeVertical * 4.5
                  ),
                  child: Text("Home",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4.5,
                      left: SizeConfig.blockSizeVertical * 4.5
                  ),
                  child: Text("My List",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4.5,
                      left: SizeConfig.blockSizeVertical * 4.5
                  ),
                  child: Text("Profile",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25
                  ),),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.4,
                ),
                Container(child: Image(image: AssetImage('assets/drawer/Line 2.jpg'))),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4.5,
                      left: SizeConfig.blockSizeVertical * 4.5
                  ),
                  child: Text("Logout",style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2.25
                  ),),
                ),


              ],
            ),
          )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              backgroundColor: Color(0xffE33B3B),
              mini: true,
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/homepage/Ellipse 1.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Icon(Icons.subdirectory_arrow_right_outlined),
              )
          ),
          FloatingActionButton(
            backgroundColor: Color(0xffE33B3B),
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/my list/Ellipse 2.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/my list/Rectangle 55.png'),
                      fit: BoxFit.fill
                  )
              ),
              height: SizeConfig.screenHeight * 0.25,
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.16,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/my list/Rectangle 32.png',),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.05
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: SizeConfig.blockSizeVertical * 5,
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: SizeConfig.blockSizeVertical * 3.25,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal*2.25
                                ),
                                width:SizeConfig.screenWidth * 0.8,
                                decoration: BoxDecoration(
                                    image:  DecorationImage(
                                        image: AssetImage('assets/my list/tile.png'),
                                        fit: BoxFit.fitWidth
                                    )),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      suffixIcon:Icon(Icons.search) ,
                                      hintText: "Search",
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 2.5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Monthly",style: TextStyle(color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: SizeConfig.blockSizeVertical * 0.5,),
                            Text("Current List",style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("12",style: TextStyle(color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: SizeConfig.blockSizeVertical * 0.5,),
                            Text("Total Items",style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("1200",style: TextStyle(color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: SizeConfig.blockSizeVertical * 0.5,),
                            Text("Total Cost",style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeVertical * 1.5),),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 2,
                bottom: SizeConfig.blockSizeVertical * 2,
              ),
              child: Text(
                "Item Lists",
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.25, fontWeight: FontWeight.bold),
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                      onTap: (){
                      },
                      title: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2
                        ),
                        child: Text('Dove Soap',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      subtitle: Text('Qty: 1 Pc  |  Price: \$15'),
                      leading: Image(image: AssetImage('assets/dove.jpg')),
                      trailing: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                  )
                              ),
                              child: ImageIcon(AssetImage('assets/add item to list/minus.png'),
                                color: Colors.red,),
                            ),
                            Container(child: Text("1"),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1.5,
                                right:  SizeConfig.blockSizeHorizontal * 1.5,
                              ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  )                            ),
                              child: ImageIcon(AssetImage('assets/add item to list/plus.png'),
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                      onTap: (){
                      },
                      title: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2
                        ),
                        child: Text('Parachute Oil',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      subtitle: Text('Qty: 1 Pc  |  Price: \$15'),
                      leading: Image(image: AssetImage('assets/dove.jpg')),
                      trailing: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                  )
                              ),
                              child: ImageIcon(AssetImage('assets/add item to list/minus.png'),
                                color: Colors.red,),
                            ),
                            Container(child: Text("1"),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1.5,
                                right:  SizeConfig.blockSizeHorizontal * 1.5,
                              ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  )                            ),
                              child: ImageIcon(AssetImage('assets/add item to list/plus.png'),
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                      onTap: (){
                      },
                      title: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2
                        ),
                        child: Text('Colgate Toothpaste',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      subtitle: Text('Qty: 1 Pc  |  Price: \$15'),
                      leading: Image(image: AssetImage('assets/dove.jpg')),
                      trailing: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                  )
                              ),
                              child: ImageIcon(AssetImage('assets/add item to list/minus.png'),
                                color: Colors.red,),
                            ),
                            Container(child: Text("1"),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1.5,
                                right:  SizeConfig.blockSizeHorizontal * 1.5,
                              ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  )                            ),
                              child: ImageIcon(AssetImage('assets/add item to list/plus.png'),
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                      onTap: (){
                      },
                      title: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2
                        ),
                        child: Text('Neem Facewash',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      subtitle: Text('Qty: 1 Pc  |  Price: \$15'),
                      leading: Image(image: AssetImage('assets/dove.jpg')),
                      trailing: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                  )
                              ),
                              child: ImageIcon(AssetImage('assets/add item to list/minus.png'),
                                color: Colors.red,),
                            ),
                            Container(child: Text("1"),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1.5,
                                right:  SizeConfig.blockSizeHorizontal * 1.5,
                              ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  )                            ),
                              child: ImageIcon(AssetImage('assets/add item to list/plus.png'),
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                      onTap: (){
                      },
                      title: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2
                        ),
                        child: Text('Sunscreen',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      subtitle: Text('Qty: 1 Pc  |  Price: \$15'),
                      leading: Image(image: AssetImage('assets/dove.jpg')),
                      trailing: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                  )
                              ),
                              child: ImageIcon(AssetImage('assets/add item to list/minus.png'),
                                color: Colors.red,),
                            ),
                            Container(child: Text("1"),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1.5,
                                right:  SizeConfig.blockSizeHorizontal * 1.5,
                              ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  )                            ),
                              child: ImageIcon(AssetImage('assets/add item to list/plus.png'),
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                      onTap: (){
                      },
                      title: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2
                        ),
                        child: Text('Sunscreen',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      subtitle: Text('Qty: 1 Pc  |  Price: \$15'),
                      leading: Image(image: AssetImage('assets/dove.jpg')),
                      trailing: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                  )
                              ),
                              child: ImageIcon(AssetImage('assets/add item to list/minus.png'),
                                color: Colors.red,),
                            ),
                            Container(child: Text("1"),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1.5,
                                right:  SizeConfig.blockSizeHorizontal * 1.5,
                              ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  )                            ),
                              child: ImageIcon(AssetImage('assets/add item to list/plus.png'),
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                      onTap: (){
                      },
                      title: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2
                        ),
                        child: Text('Sunscreen',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      subtitle: Text('Qty: 1 Pc  |  Price: \$15'),
                      leading: Image(image: AssetImage('assets/dove.jpg')),
                      trailing: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                  )
                              ),
                              child: ImageIcon(AssetImage('assets/add item to list/minus.png'),
                                color: Colors.red,),
                            ),
                            Container(child: Text("1"),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1.5,
                                right:  SizeConfig.blockSizeHorizontal * 1.5,
                              ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  )                            ),
                              child: ImageIcon(AssetImage('assets/add item to list/plus.png'),
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.02,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                      onTap: (){
                      },
                      title: Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2
                        ),
                        child: Text('Sunscreen',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      subtitle: Text('Qty: 1 Pc  |  Price: \$15'),
                      leading: Image(image: AssetImage('assets/dove.jpg')),
                      trailing: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                  )
                              ),
                              child: ImageIcon(AssetImage('assets/add item to list/minus.png'),
                                color: Colors.red,),
                            ),
                            Container(child: Text("1"),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 1.5,
                                right:  SizeConfig.blockSizeHorizontal * 1.5,
                              ),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  )                            ),
                              child: ImageIcon(AssetImage('assets/add item to list/plus.png'),
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      )
                  ),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
