import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Widgets/Notification.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                        image: AssetImage('assets/Ellipse 1.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Icon(Icons.subdirectory_arrow_right_outlined),
              )
          ),
          Container(
            width: SizeConfig.screenWidth * 0.4,
            child: FloatingActionButton(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    SizeConfig.blockSizeVertical * 5
                )
            ) ,
              backgroundColor: Color(0xffE33B3B),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Checkout",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2
                  ),),
                  Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,)
                ],
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
                      image: AssetImage('assets/Rectangle 55.png'),
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
                            image: AssetImage('assets/Rectangle 32.png',),
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
                              child: ImageIcon(AssetImage('assets/plus.png'),
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
                              child: ImageIcon(AssetImage('assets/minus.png'),
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
                              child: ImageIcon(AssetImage('assets/plus.png'),
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
                              child: ImageIcon(AssetImage('assets/minus.png'),
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
                              child: ImageIcon(AssetImage('assets/plus.png'),
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
                              child: ImageIcon(AssetImage('assets/minus.png'),
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
                              child: ImageIcon(AssetImage('assets/plus.png'),
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
                              child: ImageIcon(AssetImage('assets/minus.png'),
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
                              child: ImageIcon(AssetImage('assets/plus.png'),
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
                              child: ImageIcon(AssetImage('assets/minus.png'),
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
                              child: ImageIcon(AssetImage('assets/plus.png'),
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
                              child: ImageIcon(AssetImage('assets/minus.png'),
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
                              child: ImageIcon(AssetImage('assets/plus.png'),
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
                              child: ImageIcon(AssetImage('assets/minus.png'),
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
                              child: ImageIcon(AssetImage('assets/plus.png'),
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
