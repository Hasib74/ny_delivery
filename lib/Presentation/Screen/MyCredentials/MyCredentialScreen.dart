
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/MyCredentials/Controller/CredentialController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';

class MyCredentialsScreen extends StatelessWidget {

  CredentialController credentialController = Get.find();

  /*
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return SingleChildScrollView(
       child: Container(
         child: Column(
           children: [
             Container(
               width: Get.width,
               margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
               child: Column(
                 children: <Widget>[
                   Container(
                     padding:EdgeInsets.fromLTRB(15, 8, 00, 00),
                   color: Colors.deepOrange[400],
                     width: Get.width,
                     height: 35,
                     child: Text('Check & Confirm Order',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w800,
                       color: Colors.white,
                     ),),
                   ),
                   Container(
                     width: Get.width,
                     color: Colors.deepOrange[100],
                     padding: EdgeInsets.fromLTRB(15, 7, 10, 5),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text('Ship To:',
                           style:TextStyle(
                             fontWeight: FontWeight.w900,
                             fontSize: 16,
                             color: Colors.black,
                           ),),
                         SizedBox(height: 5,),
                         Text('Razin Dhar',
                           style:TextStyle(
                             fontWeight: FontWeight.w900,
                             fontSize: 12,
                             color: Colors.black,
                           ),),
                         SizedBox(height: 3,),
                         Text('5/A, road #3, Dhanmondi, Dhaka-1205',
                           style:TextStyle(
                             fontWeight: FontWeight.w600,
                             fontSize: 12,
                             color: Colors.black,
                           ),),
                         SizedBox(height: 3,),
                         Text('Email: razin@gmail.com',
                           style:TextStyle(
                             fontWeight: FontWeight.w600,
                             fontSize: 12,
                             color: Colors.black,
                           ),),
                         SizedBox(height: 3,),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Text('Phone: 01732873938',
                               style:TextStyle(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 12,
                                 color: Colors.black,
                               ),),
                             SizedBox(width: 100,),
                             Container(
                               color: Colors.deepOrange[200],
                               height: 23,
                               width: 130,
                               padding: EdgeInsets.all(0),
                               child: RaisedButton(
                                 onPressed: (){},
                                 elevation: 20,
                                 splashColor: Colors.cyanAccent,
                                 color: Colors.deepOrange[400],
                                 child: Text('View Details',
                                   style:TextStyle(
                                     fontWeight: FontWeight.w900,
                                     fontSize: 14,
                                     color: Colors.white,
                                   ),),

                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                   Container(
                     width: Get.width,
                     color: Colors.greenAccent[100],
                     padding: EdgeInsets.fromLTRB(15, 7, 10, 5),
                     child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text('Selected Deliveryman',
                                 style:TextStyle(
                                   fontWeight: FontWeight.w900,
                                   fontSize: 16,
                                   color: Colors.black,
                                 ),),
                               SizedBox(height: 5,),
                               Text('JR. Rahaman',
                                 style:TextStyle(
                                   fontWeight: FontWeight.w800,
                                   fontSize: 12,
                                   color: Colors.black,
                                 ),),
                               SizedBox(height: 3,),
                               Text('ID No: RN 56234567',
                                 style:TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 12,
                                   color: Colors.black,
                                 ),),
                               SizedBox(height: 3,),
                               Text('Area: Dhanmondi Dhaka',
                                 style:TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 12,
                                   color: Colors.black,
                                 ),),
                               SizedBox(height: 3,),
                             ],
                           ),
                          // SizedBox(width:40),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: <Widget>[
                             Image.network('https://images.unsplash.com/photo-1533518463841-d62e1fc91373?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                               height: 50,
                               width: 50,
                               fit: BoxFit.contain,
                             ),
                               SizedBox(height: 10,),
                               Container(
                                 color: Colors.deepOrange[200],
                                 height: 23,
                                 width: 130,
                                 padding: EdgeInsets.all(0),
                                 child: RaisedButton(
                                   onPressed: (){},
                                   elevation: 20,
                                   splashColor: Colors.cyanAccent,
                                   color: Colors.deepOrange[400],
                                   child: Text('View Profile',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w900,
                                       fontSize: 14,
                                       color: Colors.white,
                                     ),),

                                 ),
                               ),
                             ],
                           ),
                         ],
                     ),
                   ),
                   SizedBox(height: 5,),
                   Container(
                     padding:EdgeInsets.fromLTRB(15, 8, 00, 00),
                     color: Colors.deepOrange[400],
                     width: Get.width,
                     height: 35,
                     child: Text('Delivery Option',
                       style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w800,
                         color: Colors.white,
                       ),),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.grey[200],width:3,)
                     ),
                     child: Column(
                       children: <Widget>[
                         Container(
                           width: Get.width,
                           padding: EdgeInsets.fromLTRB(15, 7, 10, 5),

                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: <Widget>[
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Text('Spicy Hot Italian Pizza',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w900,
                                       fontSize: 16,
                                       color: Colors.black,
                                     ),),
                                   SizedBox(height: 5,),
                                   Text('Price: \$278 USD',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w800,
                                       fontSize: 12,
                                       color: Colors.red[600],
                                     ),),
                                   SizedBox(height: 3,),
                                   Text('Discounted Price: \$0 USD',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w600,
                                       fontSize: 12,
                                       color: Colors.black,
                                     ),),
                                   SizedBox(height: 3,),
                                   Text('Quantity: 2',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w600,
                                       fontSize: 12,
                                       color: Colors.black,
                                     ),),
                                   SizedBox(height: 3,),
                                   Text('Size: 12" (Family Pack) ',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w600,
                                       fontSize: 12,
                                       color: Colors.black,
                                     ),),
                                   SizedBox(height: 5,),
                                   Container(
                                     padding: EdgeInsets.fromLTRB(6,3,3,3),
                                     height: 36,
                                     width: 160,
                                     decoration: BoxDecoration(
                                       color: Colors.deepOrange[100],
                                         border: Border.all(color:Colors.deepOrange[300],width:2, )
                                     ),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment:CrossAxisAlignment.start,
                                       children: <Widget>[
                                         Text('Home Delivery',
                                           style:TextStyle(
                                             fontWeight: FontWeight.w800,
                                             fontSize: 12,
                                             color: Colors.black,
                                           ),),
                                         Text('Est. Arrival: 4 April or 1 hour',
                                           style:TextStyle(
                                             fontWeight: FontWeight.w600,
                                             fontSize: 10,
                                             color: Colors.black54,
                                           ),),
                                       ],
                                     ),
                                   ),
                                   SizedBox(height: 3,),
                                 ],
                               ),
                               // SizedBox(width:40),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                 children: <Widget>[
                                   Image.network('https://images.unsplash.com/photo-1533518463841-d62e1fc91373?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                                     height: 100,
                                     width: 100,
                                     fit: BoxFit.contain,
                                   ),
                                   //SizedBox(height: 60,),
                                   Container(
                                     padding: EdgeInsets.fromLTRB(6,3,3,3),
                                     height: 36,
                                     width: 160,
                                     decoration: BoxDecoration(
                                         color: Colors.deepOrange[100],
                                         border: Border.all(color:Colors.deepOrange[300],width:2, )
                                     ),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment:CrossAxisAlignment.start,
                                       children: <Widget>[
                                         Text('Delivery Payment',
                                           style:TextStyle(
                                             fontWeight: FontWeight.w800,
                                             fontSize: 12,
                                             color: Colors.black,
                                           ),),
                                         Text('Cash On Delivery',
                                           style:TextStyle(
                                             fontWeight: FontWeight.w600,
                                             fontSize: 10,
                                             color: Colors.black54,
                                           ),),
                                       ],
                                     ),
                                   ),
                                   SizedBox(height: 3,),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         SizedBox(height: 10,),
                         Container(
                           padding:EdgeInsets.fromLTRB(15, 00, 200, 00),
                           margin: EdgeInsets.fromLTRB(15, 0, 13, 0),
                           color: Colors.deepOrange[100],
                           width: Get.width,
                           height:55,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children:<Widget> [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Item Cost:',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w800,
                                       fontSize: 12,
                                       color: Colors.black,
                                     ),),
                                   Text('\$48.00',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w800,
                                       fontSize: 12,
                                       color: Colors.black,
                                     ),),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Shipping:',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w800,
                                       fontSize: 12,
                                       color: Colors.black,
                                     ),),
                                   Text('\$5.00',
                                     style:TextStyle(
                                       fontWeight: FontWeight.w800,
                                       fontSize: 12,
                                       color: Colors.black,
                                     ),),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         Container(
                           padding:EdgeInsets.fromLTRB(15, 5, 200, 15),
                           margin: EdgeInsets.fromLTRB(15, 0, 13, 0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Total Cost:',
                                 style:TextStyle(
                                   fontWeight: FontWeight.w800,
                                   fontSize: 12,
                                   color: Colors.black,
                                 ),),
                               Text('\$53.00',
                                 style:TextStyle(
                                   fontWeight: FontWeight.w800,
                                   fontSize: 12,
                                   color: Colors.black,
                                 ),),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 50,),
                   Center(
                     child: Container(
                       margin: EdgeInsets.only(left: 30,right: 30,bottom: 25),
                       color: Colors.deepOrange[200],
                       height: 30,
                       width: Get.width, ̰ ̰
                       padding: EdgeInsets.all(0),
                       child: RaisedButton(
                         onPressed: (){},
                         elevation: 10,
                         splashColor: Colors.cyanAccent,
                         color: Colors.deepOrange[400],
                         child: Text('Proceed to Confirm',
                           style:TextStyle(
                             fontWeight: FontWeight.w900,
                             fontSize: 14,
                             color: Colors.white,
                           ),),

                       ),
                     ),

                     ),
                 ],
               ),

             ),
             Container(
               color: Colors.deepOrange[400],
               width: Get.width,
               height: 15,
             ),
           ],
         ),
       ),
     );
  }

  */


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            profileTitle('Profile information'),
            profileDetails(),
            profileTitle('Change Password'),
            profileInformationEditing(),



          ],
        ),
      ),
    );
  }
  Widget profileTitle(String infoTitle){
    return Container(
      height: 35,
      margin: EdgeInsets.only(left: 10,right: 10),
      color: Colors.orange[100],
      child: Center(
        child: Text(infoTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget profileDetails(){
    return Container(
      width: Get.width,
      height: 150,// Get.height,
      margin: EdgeInsets.all(10),
      color: AppColors.drawerBackgroundColor,
      child: GetBuilder<CredentialController>(
          builder:(_controller){
          return  Column(
              children: <Widget>[

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.only(top: 5,),
                      width: 150,
                      //color: Colors.amberAccent,
                      child: Text('Current Email:',
                        style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
                    ),
                    //  SizedBox(width: 10,),
                    Expanded(

                      child: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(_controller.profileInfoDetails != null ? _controller.profileInfoDetails!.response!.email!: "",
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            style: TextStyle(fontSize: 16,fontWeight:FontWeight.normal)),
                      ),
                    ),
                  ],
                ),

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.only(top: 5,),
                      width: 150,
                      //color: Colors.amberAccent,
                      child: Text('Current Phone:',
                        style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
                    ),
                    //  SizedBox(width: 10,),
                    Expanded(

                      child: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(_controller.profileInfoDetails != null ? _controller.profileInfoDetails!.response!.phone! : "",
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            style: TextStyle(fontSize: 16,fontWeight:FontWeight.normal)),
                      ),
                    ),
                  ],
                ),

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.only(top: 5,),
                      width: 150,
                      //color: Colors.amberAccent,
                      child: Text('Current Password:',
                        style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
                    ),
                    //  SizedBox(width: 10,),
                    Expanded(

                      child: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("*********",
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            style: TextStyle(fontSize: 16,fontWeight:FontWeight.normal)),
                      ),
                    ),
                  ],
                ),


              ],
            );
          }
      ),

    );
  }
  Widget profileInformationEditing(){
    return Container(
      width: Get.width,
      height: 460,// Get.height,
      margin: EdgeInsets.all(10),
      color: AppColors.drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          profileInformationEditingRow('Current Password:', '',credentialController.currentPasswordTextField),
          profileInformationEditingRow('New Password:', '',credentialController.newPasswordTextField),
          profileInformationEditingRow('Re-type Password:', '',credentialController.retypePasswordTextField),
          SizedBox(
            height: 20,
          ),
          PasswordSave(),
        ],
      ),

    );
  }
  Widget profileInformationEditingRow(String title, String value,TextEditingController cont){
    return  Row(

      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15),
          padding: EdgeInsets.only(top: 5,),
          width: 150,
          //color: Colors.amberAccent,
          child: Text(title,
            style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
        ),
        //  SizedBox(width: 10,),
        Expanded(

          child: Container(
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              style: TextStyle(color: Colors.black),
              obscureText: true,
              controller:cont ,
              decoration: InputDecoration(
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.blueAccent, width: 2,),
                 // borderRadius: BorderRadius.all(30),
                ),
                focusedBorder:OutlineInputBorder(
                 borderSide: BorderSide(color:Colors.deepOrange, width: 2,),
                 //borderRadius: BorderRadius.all(30),
                ),
                prefixIcon:Icon(
                  Icons.enhanced_encryption,
                  size: 20,
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                /*enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: AppColors.drawerBackgroundColor)),
                border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.drawerBackgroundColor)),*/
              ),
            ),
          ),
        ),
      ],
    );
  }
  Container PasswordSave(){
    return Container(
      height:35,
      width:170,

      color: Colors.deepOrangeAccent[500],
      child: ElevatedButton(
        onPressed: (){
          credentialController.updateCredentialsInfo();
        },
        // elevation: 10,
        // color: Colors.deepOrange[300],
        // splashColor:Colors.tealAccent[400],
       child: Text('Save Changes',
       style: TextStyle(
         fontSize:16,
         fontWeight:FontWeight.w900,
         color: Colors.white,

       ),
       ),
      ),
    );
}
  





}
