// import 'dart:html';

import 'dart:typed_data';

import 'package:animated_card/animated_card.dart';
import 'package:attn_gan_app/networking.dart';
import 'package:flutter/foundation.dart';
// import 'package:anime_recommendation_app/controller/recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';

import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

class ImageGeneratePage2 extends StatefulWidget {
  @override
  State createState() => new ImageGeneratePageState2();
}

class ImageGeneratePageState2 extends State<ImageGeneratePage2> {
  String _imagepath;
  // File _image;
  // final picker = ImagePicker();

  // File _image;
  // final picker = ImagePicker();

  List imageNumber = [
    'Image 1',
    'Image 2',
    'Image 3',
    'Image 4',
    'Image 5',
    'Image 6',
    'Image 7',
    'Image 8',
    'Image 9'
  ];

  List imageName = [
    'assets/images/bird1.jpg',
    'assets/images/bird2.jpg',
    'assets/images/bird3.jpg',
    'assets/images/bird4.jpg',
    'assets/images/bird5.jpg',
    'assets/images/bird6.jpg',
    'assets/images/bird7.jpg',
    'assets/images/bird8.jpg',
    'assets/images/bird9.jpg',
  ];

  List imageName2 = [
    'assets/images/resultimg.png',
    // 'assets/images/img1.png',
    // 'assets/images/img2.png',
    // 'assets/images/img3.png',
    // 'assets/images/img4.png',
    // 'assets/images/img5.png',
    // 'assets/images/img6.png',
    // 'assets/images/img7.png',
    // 'assets/images/img8.png',
    // 'assets/images/img9.png',
  ];

  String testImage = 'assets/images/resultimg.png';

  // final String dispImage = 'http://2ef3cc8d90f1.ngrok.io';

  String dispImage = '';
  String storeURL = '';

  TextEditingController _captionTextController = TextEditingController();
  TextEditingController _urlTextController = TextEditingController();
  String url = '';

/*
'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
    'assets/images/img8.png',
    'assets/images/img9.png', 
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.shortestSide * 0.15),
                // child: CircleAvatar(
                //   radius: 50.0,
                //   backgroundImage: AssetImage("assets/images/text2image.png"),
                // ),

                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: new BoxDecoration(
                    // shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      // image: new AssetImage("assets/images/text2image.png"),
                      image: new AssetImage(
                          "assets/images/text2imagebirdicon2.jpg"),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.shortestSide * 0.06),
                child: Container(
                  child: Text(
                    'Text to image generation',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: .4,
                        fontSize: 21.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Container(
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 12.0, top: 10.0),
            //       child: Column(
            //         children: <Widget>[
            //           Padding(
            //             padding: const EdgeInsets.only(top: 8.0, left: 15.0),
            //             child: Align(
            //               alignment: Alignment.topLeft,
            //               child: Text(
            //                 'Based on',
            //                 style: GoogleFonts.lato(
            //                   textStyle: TextStyle(
            //                     color: Colors.grey,
            //                     letterSpacing: .4,
            //                     fontSize: 15.0,
            //                     fontWeight: FontWeight.w400,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           // ListView.builder(
            //           //   shrinkWrap: true,
            //           //   itemCount: 1,
            //           //   itemBuilder: (context, index) {

            //           //   },
            //           // ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, top: 20.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                  // controller: recommendationController.animeName,
                  controller: _captionTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),
                    ),
                    hintText: 'Enter the caption',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),
            FlatButton(
                color: Colors.greenAccent,
                onPressed: () {
                  // recommendationController.getRecommandation();

                  // String url = "http://2ef3cc8d90f1.ngrok.io";
                  // NetworkHelper(url).postData("yellow bird");

                  // String url = "http://2ef3cc8d90f1.ngrok.io";

                  NetworkHelper(url).postData(_captionTextController.text);

                  // setState(() {
                  //   // dispImage = _urlTextController.text;
                  //   dispImage = storeURL;
                  // });
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0, bottom: 130.0),
                          child: Center(
                            // heightFactor: 90,
                            child: SingleChildScrollView(
                              child: AlertDialog(
                                elevation: 10.0,
                                backgroundColor: Colors.indigoAccent[300],
                                content: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(top: 50.0),
                                        child: Text('Generating images...')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: FlatButton(
                                          color: Colors.indigoAccent,
                                          onPressed: () {
                                            // _onImageSaveButtonPressed();
                                            Navigator.pop(context);
                                            setState(() {
                                              dispImage =
                                                  _urlTextController.text;
                                              // dispImage = storeURL;
                                            });
                                            // Fluttertoast.showToast(msg: "Image downloaded", toastLength: Toast.LENGTH_SHORT);

                                            Toast.show(
                                                "Fetching the image", context,
                                                duration: Toast.LENGTH_LONG);
                                          },
                                          child: Text(
                                            'Display',
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: .4,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  'Process',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Generated images...',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: .4,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      // FontAwesome.download,
                      // Entypo.download,
                      Feather.download,
                      // Entypo.share,
                      // MaterialCommunityIcons.file_download_outline,
                      color: Colors.black,
                      size: 20.0,
                    ),
                    onPressed: () {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 8.0,
                                  bottom: 330.0),
                              child: Center(
                                child: AlertDialog(
                                  elevation: 10.0,
                                  backgroundColor: Colors.indigoAccent[300],
                                  content: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 50.0),
                                        child: Text(
                                          'Do you want to download the image?',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: .4,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30.0),
                                        child: FlatButton(
                                            color: Colors.indigoAccent,
                                            onPressed: () {
                                              _onImageSaveButtonPressed();
                                              Navigator.pop(context);
                                              // Fluttertoast.showToast(msg: "Image downloaded", toastLength: Toast.LENGTH_SHORT);
                                              Toast.show(
                                                  "Image downloaded", context,
                                                  duration: Toast.LENGTH_LONG);
                                            },
                                            child: Text(
                                              'DOWNLOAD',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: .4,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    })
              ],
            ),
            //from here
            // Expanded(
            //   child: ListView.builder(
            //     // physics: ClampingScrollPhysics(),
            //     // itemCount: imageNumber.length,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: imageName2.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       //abcd
            //       return AnimatedCard(
            //           curve: Curves.ease,
            //           direction: AnimatedCardDirection.bottom,
            //           initDelay: Duration(milliseconds: 1),
            //           duration: Duration(seconds: 3),
            //           child: Padding(
            //             padding: EdgeInsets.only(
            //                 top: MediaQuery.of(context).size.shortestSide *
            //                     0.01,
            //                 left: MediaQuery.of(context).size.shortestSide *
            //                     0.002,
            //                 right: MediaQuery.of(context).size.shortestSide *
            //                     0.002),
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 border:
            //                     Border.all(color: Colors.black, width: 0.2),
            //                 borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(10.0),
            //                   topRight: Radius.circular(10.0),
            //                   bottomLeft: Radius.circular(10.0),
            //                   bottomRight: Radius.circular(10.0),
            //                 ),
            //                 gradient: LinearGradient(
            //                   begin: Alignment.bottomCenter,
            //                   end: Alignment.topCenter,

            //                   colors: [Colors.lightBlue[50], Colors.white],

            //                   // colors: [
            //                   //   Colors.redAccent,
            //                   //   Colors.redAccent[100]
            //                   // ],
            //                 ),
            //               ),
            //               child: Padding(
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: 1.0, vertical: 10.0),
            //                 child: Row(
            //                   mainAxisAlignment:
            //                       MainAxisAlignment.spaceBetween,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: <Widget>[
            //                     Row(
            //                       crossAxisAlignment:
            //                           CrossAxisAlignment.start,
            //                       children: <Widget>[
            //                         // Container(
            //                         //   child: Padding(
            //                         //     padding: EdgeInsets.only(
            //                         //         left: MediaQuery.of(context)
            //                         //                 .size
            //                         //                 .shortestSide *
            //                         //             0.025,
            //                         //         top: MediaQuery.of(context)
            //                         //                 .size
            //                         //                 .shortestSide *
            //                         //             0.01),
            //                         //     child: CircleAvatar(
            //                         //       radius: 20.0,
            //                         //       backgroundColor: Colors.white,
            //                         //       backgroundImage: AssetImage(
            //                         //           "assets/images/anime3.jpg"),
            //                         //     ),
            //                         //   ),
            //                         // ),
            //                         SizedBox(
            //                           width: 10.0,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: <Widget>[
            //                             Padding(
            //                               padding: EdgeInsets.all(
            //                                   MediaQuery.of(context)
            //                                           .size
            //                                           .shortestSide *
            //                                       0.01),
            //                               child: Row(
            //                                 children: <Widget>[
            //                                   Container(
            //                                     //csd
            //                                     width: MediaQuery.of(context)
            //                                             .size
            //                                             .width /
            //                                         1.35,
            //                                     child: Padding(
            //                                       padding: EdgeInsets.only(
            //                                           top: MediaQuery.of(
            //                                                       context)
            //                                                   .size
            //                                                   .shortestSide *
            //                                               0.015),
            //                                       child: Text(
            //                                         // "DTLabz",

            //                                         // imageNumber[index],

            //                                         imageNumber[index],

            //                                         // notificationController
            //                                         //     .notify_by[index],

            //                                         // "${recommendationController.model[index].name}",

            //                                         // testAnimeNames[index],
            //                                         style: GoogleFonts.roboto(
            //                                           textStyle: TextStyle(
            //                                               color: Color(
            //                                                   0xFF2A2727),
            //                                               fontSize: 15.0,
            //                                               fontWeight:
            //                                                   FontWeight.bold,
            //                                               letterSpacing: .5),
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                             Padding(
            //                               padding: EdgeInsets.only(
            //                                   top: MediaQuery.of(context)
            //                                           .size
            //                                           .shortestSide *
            //                                       0.05,
            //                                   left: MediaQuery.of(context)
            //                                           .size
            //                                           .shortestSide *
            //                                       0.01),
            //                               // child: Container(
            //                               //   width: MediaQuery.of(context)
            //                               //           .size
            //                               //           .width /
            //                               //       1.35,
            //                               //   child: Text(
            //                               //     // "${recommendationController.model[index].genre}",
            //                               //     testGenreAnime[index],
            //                               //     style: GoogleFonts.lato(
            //                               //       textStyle: TextStyle(
            //                               //           color: Color(0xFF2A2727),
            //                               //           fontSize: 15.0,
            //                               //           fontWeight: FontWeight.w400,
            //                               //           letterSpacing: .5),
            //                               //     ),
            //                               //   ),
            //                               // ),
            //                               child: Container(
            //                                 // color: Colors.white,
            //                                 width: MediaQuery.of(context)
            //                                         .size
            //                                         .width *
            //                                     1.0,
            //                                 height: MediaQuery.of(context)
            //                                         .size
            //                                         .height *
            //                                     0.35,
            //                                 decoration: new BoxDecoration(
            //                                   // shape: BoxShape.circle,
            //                                   image: new DecorationImage(
            //                                     fit: BoxFit.cover,
            //                                     colorFilter: ColorFilter.mode(
            //                                         Colors.black
            //                                             .withOpacity(1.0),
            //                                         BlendMode.dstATop),
            //                                     image: new AssetImage(
            //                                         // imageName[index]
            //                                         imageName2[index]),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ),
            //                             Row(
            //                               children: <Widget>[
            //                                 Padding(
            //                                   padding: EdgeInsets.only(
            //                                     top: MediaQuery.of(context)
            //                                             .size
            //                                             .shortestSide *
            //                                         0.01,
            //                                     left: MediaQuery.of(context)
            //                                             .size
            //                                             .shortestSide *
            //                                         0.01,
            //                                   ),
            //                                   child: Row(
            //                                     children: <Widget>[
            //                                       Container(
            //                                         width:
            //                                             MediaQuery.of(context)
            //                                                     .size
            //                                                     .width /
            //                                                 5.0,
            //                                         child: Text(
            //                                           // testAnimeNames[index],
            //                                           'Hi',
            //                                           style: GoogleFonts.lato(
            //                                             textStyle: TextStyle(
            //                                                 color:
            //                                                     Colors.white,
            //                                                 fontSize: 12.0,
            //                                                 fontWeight:
            //                                                     FontWeight
            //                                                         .w400,
            //                                                 letterSpacing:
            //                                                     .5),
            //                                           ),
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                                 SizedBox(
            //                                   width: 3.0,
            //                                 ),
            //                                 //ssss
            //                               ],
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     Column(
            //                       children: <Widget>[],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         );
            //       //abcd
            //     },
            //   ),
            // ),
            //till here

            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              // height: 500.0,
              // height: 1800.0,

              // color: Colors.black,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,

                  colors: [Colors.lightBlue[50], Colors.white],

                  // colors: [
                  //   Colors.redAccent,
                  //   Colors.redAccent[100]
                  // ],
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // Container(
                    //   width: 160.0,
                    //   color: Colors.red,
                    // ),
                    // Container(
                    //   width: 160.0,
                    //   color: Colors.blue,
                    // ),
                    // Container(
                    //   width: 160.0,
                    //   color: Colors.green,
                    // ),
                    // Container(
                    //   width: 160.0,
                    //   color: Colors.yellow,
                    // ),
                    // Container(
                    //   width: 160.0,
                    //   color: Colors.orange,
                    // ),
                    Container(
                      // width: MediaQuery.of(context).size.width * 1.0,
                      // width: 1360.0,
                      // height: MediaQuery.of(context).size.height * 0.85,
                      height: 250,

                      /*decoration: new BoxDecoration(
                        // shape: BoxShape.circle,
                        image: new DecorationImage(
                          // fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(1.0), BlendMode.dstATop),
                          image: new AssetImage(
                            // imageName[index]
                            // imageName2[index]
                            'assets/images/resultimg.png',
                            // testImage,
                            // dispImage,
                          ),

                          // image: Image.network('http://2ef3cc8d90f1.ngrok.io'),

                          // child: new Image.network('http://2ef3cc8d90f1.ngrok.io')
                        ),
                      ),*/
                      // child: new Image.network('http://2ef3cc8d90f1.ngrok.io')
                      child: dispImage == ''
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 130.0, top: 30.0),
                              child: Center(
                                child: FlatButton(
                                    color: Colors.indigoAccent,
                                    onPressed: () {
                                      // _onImageSaveButtonPressed();
                                      // Navigator.pop(context);
                                      // Fluttertoast.showToast(msg: "Image downloaded", toastLength: Toast.LENGTH_SHORT);

                                      /*setState(() {
                                        dispImage =
                                            'http://2ef3cc8d90f1.ngrok.io';
                                      });*/ //imp code setstate

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 8.0,
                                                  bottom: 130.0),
                                              child: Center(
                                                // heightFactor: 90,
                                                child: SingleChildScrollView(
                                                  child: AlertDialog(
                                                    elevation: 10.0,
                                                    backgroundColor: Colors
                                                        .indigoAccent[300],
                                                    content: Column(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 50.0),
                                                          child: TextFormField(
                                                              // controller: recommendationController.animeName,
                                                              controller:
                                                                  _urlTextController,
                                                              style: GoogleFonts
                                                                  .lato(
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      .4,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              decoration:
                                                                  new InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .greenAccent,
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    const Radius
                                                                            .circular(
                                                                        25.0),
                                                                  ),
                                                                ),
                                                                hintText:
                                                                    'Enter the URL',
                                                                hintStyle:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  textStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    letterSpacing:
                                                                        .4,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            8.0,
                                                                        bottom:
                                                                            8.0,
                                                                        right:
                                                                            8.0,
                                                                        left:
                                                                            15.0),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 30.0),
                                                          child: FlatButton(
                                                              color: Colors
                                                                  .indigoAccent,
                                                              onPressed: () {
                                                                // _onImageSaveButtonPressed();
                                                                Navigator.pop(
                                                                    context);
                                                                setState(() {
                                                                  url =
                                                                      _urlTextController
                                                                          .text;

                                                                  storeURL =
                                                                      _urlTextController
                                                                          .text;
                                                                });
                                                                // Fluttertoast.showToast(msg: "Image downloaded", toastLength: Toast.LENGTH_SHORT);
                                                                Toast.show(
                                                                    "Fetching the image",
                                                                    context,
                                                                    duration: Toast
                                                                        .LENGTH_LONG);
                                                              },
                                                              child: Text(
                                                                'GO',
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  textStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        .4,
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          });

                                      // Toast.show("Image downloaded", context,
                                      //     duration: Toast.LENGTH_LONG);
                                    },
                                    child: Text(
                                      'GENERATE',
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .4,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          : Image.network(
                              // 'http://2ef3cc8d90f1.ngrok.io',
                              dispImage,
                              // scale: 6.0,
                              // height: 600,
                              // width: 1350,
                            ),
                    ),
                    //
                  ],
                ),
              ),
            ),

            // SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child:
            //       ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Colors.indigoAccent,
                  child: Icon(
                    // FontAwesome.download,
                    // Entypo.download,
                    // Feather.download,
                    Entypo.share,
                    // MaterialCommunityIcons.file_download_outline,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  // onPressed: () {
                  //   // SaveImage(_imagepath);
                  // }

                  // onPressed: () async => await _shareImage(),
                  onPressed: () async => await _shareImageFromUrl(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void SaveImage(path) async{
  //   SharedPreferences saveimage = await SharedPreferences.getInstance();
  //   saveimage.setString("imagepath", path);
  // }

  /*void _onImageShareButtonPressed() async {
    var response = await http.get(
        'https://mlltgcn1axte.i.optimole.com/h081bd0-Ho6YTIMz/w:auto/h:auto/q:74/https://codesearchonline.com/wp-content/uploads/2020/01/social-media-management-8.png');
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
    print(filePath);

    BASE64_IMAGE = filePath;

    final ByteData bytes = await rootBundle.load(BASE64_IMAGE);
    await EsysFlutterShare.shareImage(
        'myImageTest.png', bytes, 'my image title');
  }*/

  Future<void> _shareImage() async {
    try {
      final ByteData bytes = await rootBundle.load(
        'assets/images/resultimg.png',
      );
      await Share.file(
          'esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png',
          text: 'Generated Bird Images from Text2Image App');
    } catch (e) {
      print('error: $e');
    }
  }

  Future<void> _shareImageFromUrl() async {
    try {
      // var request = await HttpClient().getUrl(Uri.parse(
      //     'https://shop.esys.eu/media/image/6f/8f/af/amlog_transport-berwachung.jpg'));

      // var request = await HttpClient().getUrl(Uri.parse(
      //     'https://i.pinimg.com/originals/b0/e2/ac/b0e2ac28a0c644f93e4b31a6cfe6f991.jpg'));

      // var request =
      //     await HttpClient().getUrl(Uri.parse('http://2ef3cc8d90f1.ngrok.io'));

      var request = await HttpClient().getUrl(Uri.parse(dispImage));

      // var request = await HttpClient().getUrl(Uri.parse(
      //     'https://community.fansshare.com/pic135/w/annemarie-gethmann-siefert/1200/23096_rainbow_lorikeet.jpg'));

      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg',
          text: 'Generated Bird Images from Text2Image App');
    } catch (e) {
      print('error: $e');
    }
  }

  var _imageFile;

  void _onImageSaveButtonPressed() async {
    print("_onImageSaveButtonPressed");
    // var imageResponse = await http
    //     .get('http://upload.art.ifeng.com/2017/0425/1493105660290.jpg');

    // var imageResponse = await http.get(
    //     'https://www.meme-arsenal.com/memes/2f9cc9de456636885d03bc5f70f3b617.jpg');

    // var imageResponse = await http.get('http://2ef3cc8d90f1.ngrok.io');
    var imageResponse = await http.get(dispImage);

    debugPrint(imageResponse.statusCode.toString());

    var filePath =
        await ImagePickerSaver.saveFile(fileData: imageResponse.bodyBytes);

    var savedFile = File.fromUri(Uri.file(filePath));
    setState(() {
      _imageFile = Future<File>.sync(() => savedFile);
    });
  }

  /*
  void _onImagDownloadButtonPressed() async {
    var response = await http.get(
        'https://mlltgcn1axte.i.optimole.com/h081bd0-Ho6YTIMz/w:auto/h:auto/q:74/https://codesearchonline.com/wp-content/uploads/2020/01/social-media-management-8.png');
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  }
  */
}

/*

 */
