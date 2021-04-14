import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/ProductList.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/ui/EditProfile2.dart';
import 'package:flutter_ecommerce/ui/ItemListGrid.dart';

class MainListPage extends StatefulWidget {
  @override
  _MainListPageState createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffE33B3B),
        onPressed: () {},
        child: Icon(
          Icons.shopping_cart,
        ),
      ),
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
                    image: AssetImage('assets/Rectangle 55.jpg'),
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
                        radius: SizeConfig.blockSizeVertical * 4.75,
                        backgroundColor: Colors.white,
                        child: Image(image: AssetImage(''),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.25
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
                Container(child: Image(image: AssetImage('assets/Line 1.jpg'))),
                InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: Container(
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
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemListGrid()),
                    );
                  },
                  child: Container(
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
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return EditProfile2();
                    }));
                  },
                  child: Container(
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
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.4,
                ),
                Container(child: Image(image: AssetImage('assets/Line 2.jpg'))),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Rectangle 25.png'),
                    fit: BoxFit.fill
                ),
              ),
              height: SizeConfig.screenHeight * 0.48,
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.05,
                        bottom: SizeConfig.screenHeight * 0.05,
                      ),
                      child: Image(image: AssetImage('assets/applogo.png'),
                        height: SizeConfig.blockSizeVertical * 8,
                        width: SizeConfig.screenWidth * 0.8,)
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal*2.25
                    ),
                    margin: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.07,
                        bottom: SizeConfig.screenHeight * 0.06
                    ),
                    width: SizeConfig.screenWidth * 0.8,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/tile.png'),
                            fit: BoxFit.fitWidth
                        )),
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon:Icon(Icons.search) ,
                          hintText: "Search",
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth * 0.7,
                    height: SizeConfig.screenHeight * 0.07,
                    child: Text(
                      "Create New List",
                      style: TextStyle(color: Colors.white,
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Rectangle 26.png'),
                            fit: BoxFit.fill
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.03,
                  bottom: SizeConfig.screenHeight * 0.03 ),
              child: Text(
                "Previous Lists",
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,itemCount: 10,
              itemBuilder: (context,index) {
                return Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.05,
                      left: SizeConfig.screenWidth * 0.03,
                      right: SizeConfig.screenWidth * 0.03
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductList()),
                      );
                    },
                    title: Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical * 2
                      ),
                      child: Text('Monthly List', style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    subtitle: Text('Money Spent : 3500'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(child: Text('Item Qty: 35',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: SizeConfig.blockSizeVertical * 1.75
                          ),),
                          margin: EdgeInsets.only(
                              bottom: SizeConfig.blockSizeVertical * 1
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.green, width: 1.0)),
                            child: Icon(Icons.add, color: Colors.green,))
                      ],
                    ),
                  ),
                );
              }

            ),
          ],
        ),
      ),
    );
  }
}
