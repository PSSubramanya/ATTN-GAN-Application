import 'package:animated_card/animated_card.dart';
// import 'package:anime_recommendation_app/controller/recommendation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

class ImageGeneratePage extends StatefulWidget {
  @override
  State createState() => new ImageGeneratePageState();
}

class ImageGeneratePageState extends State<ImageGeneratePage> {
  // List<String> basedOn = [
  //   'ANIME NAME',
  //   'GENRE',
  // ];

  // static List<String> checkedItemList = [
  //   'ANIME NAME',
  // ];

  // List<String> selectedItemList = checkedItemList ?? [];
  // int indexSelected = 0;
  // String selectedItem;

  List testAnimeNames = [
    'Naruto',
    'Dragon Ball Z',
    'One Piece',
    'Death Note',
    'Parasyte',
    'Assasination Classroom',
    'Naruto',
    'Dragon Ball Z',
    'One Piece',
  ];

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

  List testGenreAnime = [
    'Action, Adventure, Drama, Life lessons, Emotional',
    'Action, Adventure, Drama, Emotional',
    'Action, Adventure, Drama, Emotional',
    'Investigation, Twist, Drama',
    'Action, Twist, Emotional',
    'Life lessons, Emotional',
    'Investigation, Twist, Drama',
    'Action, Twist, Emotional',
    'Life lessons, Emotional',
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
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
    'assets/images/img8.png',
    'assets/images/img9.png',
  ];

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
      body: Column(
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
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: new BoxDecoration(
                  // shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: new AssetImage("assets/images/text2image.png"),
                  ),
                ),
              )
              ),
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
              },
              child: Text(
                'Generate',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: .4,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
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

          Expanded(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: imageNumber.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    AnimatedCard(
                      curve: Curves.ease,
                      direction: AnimatedCardDirection.bottom,
                      initDelay: Duration(milliseconds: 1),
                      duration: Duration(seconds: 3),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top:
                                MediaQuery.of(context).size.shortestSide * 0.01,
                            left: MediaQuery.of(context).size.shortestSide *
                                0.002,
                            right: MediaQuery.of(context).size.shortestSide *
                                0.002),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Container(
                                    //   child: Padding(
                                    //     padding: EdgeInsets.only(
                                    //         left: MediaQuery.of(context)
                                    //                 .size
                                    //                 .shortestSide *
                                    //             0.025,
                                    //         top: MediaQuery.of(context)
                                    //                 .size
                                    //                 .shortestSide *
                                    //             0.01),
                                    //     child: CircleAvatar(
                                    //       radius: 20.0,
                                    //       backgroundColor: Colors.white,
                                    //       backgroundImage: AssetImage(
                                    //           "assets/images/anime3.jpg"),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .shortestSide *
                                                  0.01),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                //csd
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.35,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .shortestSide *
                                                          0.015),
                                                  child: Text(
                                                    // "DTLabz",

                                                    // imageNumber[index],

                                                    imageNumber[index],
                                                    
                                                    
                                                    
                                                    // notificationController
                                                    //     .notify_by[index],

                                                    // "${recommendationController.model[index].name}",

                                                    // testAnimeNames[index],
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color:
                                                              Color(0xFF2A2727),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: .5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .shortestSide *
                                                  0.05,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .shortestSide *
                                                  0.01),
                                          // child: Container(
                                          //   width: MediaQuery.of(context)
                                          //           .size
                                          //           .width /
                                          //       1.35,
                                          //   child: Text(
                                          //     // "${recommendationController.model[index].genre}",
                                          //     testGenreAnime[index],
                                          //     style: GoogleFonts.lato(
                                          //       textStyle: TextStyle(
                                          //           color: Color(0xFF2A2727),
                                          //           fontSize: 15.0,
                                          //           fontWeight: FontWeight.w400,
                                          //           letterSpacing: .5),
                                          //     ),
                                          //   ),
                                          // ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.35,
                                            decoration: new BoxDecoration(
                                              // shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                fit: BoxFit.cover,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(1.0),
                                                    BlendMode.dstATop),
                                                image: new AssetImage(
                                                    // imageName[index]
                                                    imageName2[index]
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .shortestSide *
                                                    0.01,
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .shortestSide *
                                                    0.01,
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5.0,
                                                    child: Text(
                                                      testAnimeNames[index],
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: .5),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.0,
                                            ),
                                            //ssss
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
