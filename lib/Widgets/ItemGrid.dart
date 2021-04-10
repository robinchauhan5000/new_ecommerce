import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/SizeConfig.dart';

Widget itemGrid( BuildContext context,
    String title,
    String qty,
    String price){
  SizeConfig().init(context);
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical * 3)
    ),
    elevation: 2.0,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(image: AssetImage('assets/dove.jpg',),
        width: SizeConfig.screenWidth * 0.25,
        height: SizeConfig.screenHeight * 0.1,
        ),
        Divider(),
        Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title,style: TextStyle(
            color: Colors.black,fontSize: SizeConfig.blockSizeVertical * 1.75,
            fontWeight: FontWeight.bold
          ),),
          Text("Price \$$price",style: TextStyle(
            color: Colors.grey,
            fontSize: SizeConfig.blockSizeVertical * 1
          ),)
        ],),
        ),
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 0.5
          ),
          height: SizeConfig.blockSizeVertical * 2.8,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Qty : $qty",style: TextStyle(
                color: Colors.grey,
                fontSize: SizeConfig.blockSizeVertical * 1.5,
                fontWeight: FontWeight.bold
            ),),
            Container(
              width: SizeConfig.blockSizeHorizontal * 15,
              height: SizeConfig.blockSizeVertical * 3,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0
                )
              ),
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
                    child: Icon(Icons.remove,color: Colors.red,size: SizeConfig.blockSizeVertical * 1.5,)
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 1.5,
                      right: SizeConfig.blockSizeHorizontal * 1.5
                    ),
                    child: Text("1",style: TextStyle(
                    ),),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                          )
                      ),
                      child: Icon(Icons.add,color: Colors.green,size: SizeConfig.blockSizeVertical * 1.5,)
                  ),
                ],
              ),
            )
          ],),
        ),
      ],
    ),
  );
}